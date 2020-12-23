//
//  Settings_And_Question_Model.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/22/20.
//

import Foundation



class Settings: ObservableObject{
    let qOptions = ["5", "10", "15", "all"] // Must increment by 5, last element must be all
    
    @Published var selection = 0
    @Published var timesTableSize = 3 {
        didSet{
            generateQuestions() // generate the Q's
            problemSet.shuffle() // Mix em up
        }
    }
    @Published var problemSet = [Question]()
    
    
    func generateQuestions(){ // 1 x 3 and 3 x 1 are considered the same, therefore both wont be added

        for num1 in 1...timesTableSize{
            for num2 in num1...timesTableSize{
                problemSet.append(Question(num1: num1, num2: num2))
                print("\(num1) x \(num2)")
            }
        }
    }
    
    
    func determineQsToServe() -> Int{
        if selection != qOptions.count - 1 { // ie anything but the last option, "all"
            return selection * 5 + 5 // equation to get num of Q's
        }
        
        return problemSet.count
    }
    
}

struct Question{
    var num1 = 0
    var num2 = 0
    var q:String{
        return "What is \(num1) x \(num2)? "
    }
    
    var ans:Int{
        return num1 * num2
    }
    
    
    func checkResponse(result:Int) -> Bool{
        return result == ans
    }
    
    init(num1:Int, num2:Int){
        self.num1 = num1
        self.num2 = num2
    }
}

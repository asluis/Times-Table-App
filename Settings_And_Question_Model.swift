//
//  Settings_And_Question_Model.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/22/20.
//

import Foundation


class Settings: ObservableObject{
    let qOptions = ["5", "10", "15", "all"] // Must increment by 5, last element must be all
    
    @Published var selection = 0 {
        didSet{
            setGameUp()
        }
    }
    
    @Published var questionsCompleted = 0
    
    @Published var score = 0
    @Published var timesTableSize = 0 {
        didSet{
            setGameUp()
        }
    }
    
    @Published var problemSet = [Question]()
    
    @Published var size:Int = 5
    
    init(){
        timesTableSize = 3
    }
    
    func setGameUp() {
        problemSet = generateQuestions() // generate the Q's
        problemSet.shuffle() // Mix em up
        size = determineQsToServeCount()
        score = 0
        questionsCompleted = 0
    }
    
    func generateQuestions() -> [Question]{ // 1 x 3 and 3 x 1 are considered the same, therefore both wont be added
        var pSet:[Question] = [Question]()
        for num1 in 1...timesTableSize{
            for num2 in num1...timesTableSize{
                pSet.append(Question(num1: num1, num2: num2))
                print("\(num1) x \(num2)")
            }
        }
        print(problemSet.count)
        return pSet
    }
    
    
    func determineQsToServeCount() -> Int{
        if selection != qOptions.count - 1 { // ie anything but the last option, "all"
            return selection * 5 + 5 // equation to get num of Q's
        }
        return problemSet.count
    }
    
    func serveQ(i:Int) -> Question{
        return problemSet[i]
    }
    
    
 
    
  
}

struct Question{
    var num1 = 0
    var num2 = 0
    public var toString:String{
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

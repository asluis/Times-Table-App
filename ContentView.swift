//
//  ContentView.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingSettings = false
    @ObservedObject var settings = Settings()
    
    var body: some View {
        Button("Show settings"){
            self.showingSettings = true
        }.sheet(isPresented: $showingSettings){
            Player_Settings(settings: self.settings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



class Settings: ObservableObject{
    let qOptions = ["5", "10", "15", "all"]
    
    @Published var selection = -1
    @Published var timesTableSize = -1
    
    
    
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

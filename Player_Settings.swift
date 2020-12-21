//
//  Player_Settings.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/21/20.
//

import SwiftUI

struct Player_Settings: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var timesTable = 3
    @State var selection = 0
    
    @ObservedObject var settings = Settings()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("times table to practice with")){
                    Stepper("\(timesTable) x \(timesTable) table", value: $timesTable, in: 3...12)
                }
                
                Section(header: Text("Number of questions to practice with")){
                    Picker("", selection: $selection){
                        //
                    }
                }
                

            }
                .navigationBarTitle("Settings")
                .navigationBarItems(leading:
                    Button(action: {
                        print("Back button pressed")
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.backward")
                        Text("Game")
                    }
                )
        }
    }
}

struct Player_Settings_Previews: PreviewProvider {
    static var previews: some View {
        Player_Settings()
    }
}

class Settings: ObservableObject{
    let qOptions = ["5", "10", "15", "all"]
    
    @Published var selection = 0
    
    
    
    
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

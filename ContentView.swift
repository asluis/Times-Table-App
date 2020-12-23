//
//  ContentView.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/20/20.
//


/*
 TODO:
    - Fix bug if user picks low table size and large question size. Will crash
    - Fix bug if user chooses 'all' option; calculations for total size are wrong in certain cases.
            - Such cases are for the 4 table size
 */

import SwiftUI

struct ContentView: View {
    
    @State var showingSettings = false
    @State var playerResponse = ""
    @ObservedObject var settings = Settings()
    
    @State var playerAns = 0
    
    @State var showingAlert = false
    @State var alertMsg = ""
    @State var alertTitle = ""

    
    func showAlert(msg:String, title:String){
        self.alertTitle = title
        self.alertMsg = msg
        showingAlert = true
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Game Settings")){
                        Text("Table: \(settings.timesTableSize) x \(settings.timesTableSize)")
                            .font(.headline)
                        
                        Text("Score: \(settings.score)")
                            .font(.headline)
                            
                    }
                   
                    
                     
                    
                    Section(header: Text("\(settings.questionsCompleted) / \(settings.size) \tquestions completed")){
                        TextField("Enter answer", text: $playerResponse, onCommit: {
                            if settings.questionsCompleted == settings.size {
                                playerResponse = ""
                                showAlert(msg: "You have completed the problem set! To try another click on settings in the top right corner.", title: "All Done!")
                                return // ie do nothing
                            }
                            
                            // Extract number
                            if let ans = Int(playerResponse) {
                                playerAns = ans
                            } else {
                                showAlert(msg: "Make sure you are not using decimal numbers and/or letters.", title: "Invalid Entry")
                            }
                            
                            // Check if answer is correct
                            if playerAns == settings.serveQ(i: settings.questionsCompleted).ans{
                                settings.score += 1
                            }
                            
                            
                            playerResponse = ""
                            settings.questionsCompleted += 1
                        })
                        .padding()
                    }
                }
                .sheet(isPresented: $showingSettings){
                    Player_Settings(settings: self.settings)
                }
            }
            .navigationBarTitle("\(settings.serveQ(i: settings.questionsCompleted).toString)")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingSettings = true
                }) {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            )
            .alert(isPresented: $showingAlert){
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("Dismiss")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}



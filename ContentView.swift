//
//  ContentView.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingSettings = false
    @State var playerAns = ""
    @ObservedObject var settings = Settings()
    @State var questionsCompleted = 0
    @State var score = 0
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Game Settings")){
                        Text("Table: \(settings.timesTableSize) x \(settings.timesTableSize)")
                            .font(.headline)
                        
                        Text("Score: \(score)")
                            .font(.headline)
                            
                    }
                   
                    
                    
                    Section(header: Text("\(questionsCompleted) / \(settings.timesTableSize) \tquestions completed")){
                        TextField("Enter answer", text: $playerAns, onCommit: {
                            
                        })
                    }
                    

                }
                .sheet(isPresented: $showingSettings){
                    Player_Settings(settings: self.settings)
                }
            }
            .navigationBarTitle("What is a x b ?")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingSettings = true
                }) {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



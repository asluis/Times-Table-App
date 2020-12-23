//
//  Player_Settings.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/21/20.
//

import SwiftUI

struct Player_Settings: View {
    
    @State var timesTable = 3
    @State var selection = 0
    @Environment(\.presentationMode) var presentationMode

    
    @ObservedObject var settings:Settings
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("times table to practice with")){
                    Stepper("\(timesTable) x \(timesTable) table", value: $timesTable, in: 3...12)
                }
                
                Section(header: Text("Number of questions to practice with")){
                    Picker("", selection: $selection){
                        ForEach(0..<settings.qOptions.count, id: \.self) { i in
                            Text("\(settings.qOptions[i])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                

            }
                .navigationBarTitle("Settings")
                .navigationBarItems(leading:
                    Button(action: {
                        print("Back button pressed")
                        settings.selection = self.selection
                        settings.timesTableSize = self.timesTable
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
        Player_Settings(settings:  Settings())
    }
}






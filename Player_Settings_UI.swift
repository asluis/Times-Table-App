//
//  Player_Settings.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/21/20.
//

import SwiftUI

struct Player_Settings: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @ObservedObject var settings:Settings
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("times table to practice with")){
                    Stepper("\(settings.timesTableSize) x \(settings.timesTableSize) table", value: $settings.timesTableSize, in: 3...12)
                }
                
                Section(header: Text("Number of questions to practice with")){
                    Picker("", selection: $settings.selection){
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






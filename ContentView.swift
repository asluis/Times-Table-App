//
//  ContentView.swift
//  Times Table App
//
//  Created by Luis Alvarez on 12/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingSettings = false
    
    var body: some View {
        Button("Show settings"){
            self.showingSettings = true
        }.sheet(isPresented: $showingSettings){
            Player_Settings()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




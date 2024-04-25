//
//  SettingsView.swift
//
//
//  Created by Griffin Turner
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var reuseCards: Bool
  
    
    
    var body: some View {
   
        NavigationView {
            Form {
                Toggle("Card should be re-used when answered incorrectly", isOn: $reuseCards)
                Toggle("Count number of correct and incorrect cards", isOn: $reuseCards)
                Toggle("Mati is like the coolest leader of all time", isOn: $reuseCards)
                Toggle("Flash cards are SOOOOOOO COOL", isOn: $reuseCards)
                
              
                .navigationBarTitle("Settings")
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Done")
                }))
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(reuseCards: .constant(false))
    }
}

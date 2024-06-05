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
                Toggle("Show timer", isOn: $reuseCards)
                Toggle("Count incorrect cards", isOn: $reuseCards)
                Toggle("Show english definition", isOn: $reuseCards)
                Toggle("Piture to word", isOn: $reuseCards)
                
              
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

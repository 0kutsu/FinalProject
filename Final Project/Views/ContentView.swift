//
//  ContentView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/8/24.
//

import SwiftUI

enum Screen {
    case userView, wordleView, loginView
}

struct ContentView: View {
    @State var screen: Screen = .loginView
    @EnvironmentObject var user: User
    
    
    var body: some View {
        VStack {
            Spacer()
            if !user.loggedIn {
                if screen == .loginView {
                    SignUpView(screen: $screen)
                }
            } else {
                ChatView()
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
    }
}
 

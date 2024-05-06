//
//  ContentView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/8/24.
//

import SwiftUI

enum Screen {
    case logoAndButtonView, userView, signUpView, logInView, chooseLanguageView, selectLevelView, homeView
}

    
struct ContentView: View {
    @State var screen: Screen = .logoAndButtonView
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            if !user.loggedIn {
                if screen == .logoAndButtonView {
                    LogoAndButtonView(screen: $screen)
                }
                if screen == .signUpView {
                    SignUpTextFieldsView(screen: $screen)
                }
                if screen == .logInView {
                    LogInTextFieldsView(screen: $screen)
                }
                if screen == .chooseLanguageView {
                    ChooseLanguageView(screen: $screen)
                }
                if screen == .selectLevelView {
                    SelectLevelView(screen: $screen)
                }
            }
            else {
                HomeView()
            }
            
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
    }
}
 

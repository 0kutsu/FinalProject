//
//  HomeView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/20/24.
//

import SwiftUI

enum ViewState {
    case home, chat, flashcards, settings, profile
}

struct HomeView: View {
    @EnvironmentObject var user: User
    @State var viewState: ViewState = .home
    
    var body: some View {
        
        
        ZStack {
            VStack() {
                if viewState == .chat {
                    MessagingNavigationView()
                }
                else if viewState == .flashcards {
                    FlashCardNavigatorView()
                }
                else if viewState == .settings {
                   
                }
                else if viewState == .profile {
                    ProfileView()
                }
                else if viewState == .home {
                    HomeScrollView()
                }
                else{
                  //  HomeView()
                    
                }
                
                Spacer()
                
                //bottom bar
                
                ZStack {
                    Rectangle()
                        .frame(height: 40)
                        .foregroundColor(Color.lightGrayA)
                        .offset(y: -7)
                    HomeNavigationBarView(viewState: $viewState)
                        .ignoresSafeArea()
                }

                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(User())
    }
}

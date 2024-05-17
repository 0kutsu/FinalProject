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
            Circle()
                .frame(width: 150, height: 150)
                .offset(x: 200, y: -100)
                .opacity(0.7)
                .foregroundColor(Color.orangeA)
                .blur(radius: 20)
            
            VStack{
                if viewState == .chat {
                    MessagingNavigationView()
                }
                else if viewState == .flashcards {
                    FlashCardNavigatorView()
                }
                else if viewState == .settings {
                   
                }
                else if viewState == .profile {
                    
                }
                else if viewState == .home {
                    HomeScrollView()
                }
                else{
                  //  HomeView()
                    
                }
                
                Spacer()
                
                //bottom bar
                HStack{
                    
                    //home button
                    Button {
                        viewState = .home
                    } label: {
                        Image(systemName: "house")
                            .font(.title)
                            .foregroundColor(Color.orangeMain)
                            
                    }

                    Spacer()
                    
                    //chat
                    Button {
                        viewState = .chat
                    } label: {
                        Image(systemName: "message")
                            .font(.title)
                            .foregroundColor(Color.orangeMain)
                            
                    }
                    
                    Spacer()
                    
                    //flashcards
                    Button {
                        viewState = .flashcards
                    } label: {
                        Image(systemName: "archivebox")
                            .font(.title)
                            .foregroundColor(Color.orangeMain)
                            
                    }
                   
                    Spacer()
                    
                    //settings
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                            .font(.title)
                            .foregroundColor(Color.orangeMain)
                            
                    }
                   
                }.padding([.leading,.trailing], 50)
                    .padding([.top], 20)
                    .background(.white)
                
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

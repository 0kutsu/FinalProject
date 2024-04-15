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
        
        
        VStack{
            
           
            //top bar
//            ZStack {
//               
//                HStack{
//              
//                    Spacer()
//                    Button {
//                        
//                    } label: {
//                        Image(uiImage: self.user.image)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .clipShape(Circle())
//                            .padding([.leading], 340)
//                            .padding([.trailing], 16)
//                          
//                            
//                            
//                    }
//                }
//                .padding(.bottom, 15)
//                .background(.white)
//                
//                Image("longLogoOrange")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 130)
//            }
               
            if viewState == .chat {
                ChatView()
            }
            else if viewState == .flashcards {
               FlashcardView()
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
            
//            ScrollView(showsIndicators: false) {
//
//
//                //flashcardpreview
//                ZStack {
//                   Rectangle()
//                        .frame(height: 170)
//                        .foregroundColor(.white)
//                        .cornerRadius(20)
//
//
//
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Spacer()
//
//                            Button {
//                                viewState = .flashcards
//
//                            } label: {
//                                Text("study")
//                                    .font(.title3)
//                                    .padding([.leading, .trailing], 20)
//                                    .padding([.top, .bottom], 10)
//                                    .background(Color.orangeMain)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(15)
//
//                            }.padding(.trailing, 25)
//                        }
//                    }.padding(.bottom, 20)
//                }
//
//
//
//
//                //dailygoal
//
//                ZStack {
//                    Rectangle()
//                        .frame(height: 300)
//                        .foregroundColor(.white)
//                        .cornerRadius(20)
//
//                    Text("Daily Goals")
//                        .foregroundColor(Color.greyText)
//                        .font(.title3)
//                        .padding(.bottom, 220)
//                        .padding(.trailing, 200)
//                }
//
//                //stats
//
//                ZStack{
//                    Rectangle()
//                         .frame(height: 300)
//                         .foregroundColor(.white)
//                         .cornerRadius(20)
//                }
//
//
//
//            }.padding([.leading, .trailing], 18)
            
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
            
        }.background(Color.greyBackground)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(User())
    }
}

//
//  HomeScrollView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 4/12/24.
//

import SwiftUI

struct HomeScrollView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            ZStack {
                
                HStack{
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(uiImage: self.user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .padding([.leading], 340)
                            .padding([.trailing], 16)
                        
                        
                        
                    }
                }
                .padding(.bottom, 15)
                .background(.white)
                
                Image("longLogoOrange")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130)
            }
            
            ScrollView(showsIndicators: false) {
                
                
                //flashcardpreview
                ZStack {
                    Rectangle()
                        .frame(height: 170)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                    
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            Button {
                                //  viewState = .flashcards
                                
                            } label: {
                                Text("study")
                                    .font(.title3)
                                    .padding([.leading, .trailing], 20)
                                    .padding([.top, .bottom], 10)
                                    .background(Color.orangeMain)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                                
                            }.padding(.trailing, 25)
                        }
                    }.padding(.bottom, 20)
                }
                
                
                
                
                //dailygoal
                
                ZStack {
                    Rectangle()
                        .frame(height: 300)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                    Text("Daily Goals")
                        .foregroundColor(Color.greyText)
                        .font(.title3)
                        .padding(.bottom, 220)
                        .padding(.trailing, 200)
                }
                
                //stats
                
                ZStack{
                    Rectangle()
                        .frame(height: 300)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                
                
                
            }.padding([.leading, .trailing], 18)
                .background(Color.greyBackground)
            
        }
    }
}

struct HomeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScrollView()
            .environmentObject(User())
    }
}

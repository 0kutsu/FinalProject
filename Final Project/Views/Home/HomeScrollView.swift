//
//  HomeScrollView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 4/12/24.
//

import SwiftUI

struct HomeScrollView: View {
    @EnvironmentObject var user: User
    @State private var startAnimation: Bool = false
    public var x:CGFloat = 150
    public var y:CGFloat = 100
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
            
            ZStack {
//
                ScrollView(showsIndicators: false) {
                    //flashcardpreview
                    
                    ZStack {
                        
                        
                        GradientBackground(color1: Color.white, color2: Color.white, opacity: 1)
                            .frame(height: 170)
                            .foregroundColor(.white)
                            .cornerRadius(20)
//                            .opacity(0.3)
                            .padding(.vertical, 10)
                    
                        VStack {
                            HStack {
                                Image("CheesePlaceholderImage")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(20)
                                    .padding(10)
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(30)
                                
//                                Spacer()
                                
                                VStack {
                                    Text("QUESO")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.orangeMain)
                                        .font(.largeTitle)
                                        .padding(.top, 10)
                                    
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
                                        
                                    }
                                    .padding(.leading, 80)
                                    .padding(.top, 10)
                                }
                            }
                        }
                    }
                    //dailygoal
                    
                    VStack {
                        Text("Daily Goals")
                            .foregroundColor(Color.greyText)
                            .font(.title3)
//                            .padding(.bottom, 220)
                            .padding(.trailing, 200)
                        
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        //                            .opacity(0.6)
                            .shadow(radius: 5)
                    }


                        
                        
                    
                    
                    //stats
                    
                    ZStack{
                        Rectangle()
                            .frame(height: 300)
                            .foregroundColor(.white)
                            .cornerRadius(20)
//                            .opacity(0.8)
                            .shadow(radius: 5)

                    }
                    
                    
                    
                }.padding([.leading, .trailing], 15)
            }
            
            
        }
    }
}

struct HomeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScrollView()
            .environmentObject(User())
    }
}

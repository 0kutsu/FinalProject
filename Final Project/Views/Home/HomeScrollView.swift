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
                    VStack {
                        Text("You Words")
//                            .font(
                    //flashcardpreview
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                Button {
                                    
                                } label: {
                                    StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
                                }

                                
                            
                            StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
                            
                            StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
                                    .padding(20)
                        }
                            .padding()
                            
                    }
                        
                    //dailygoal
                    
                    
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

//
//  HomeScrollView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 4/12/24.
//

import SwiftUI


// Langwoah!

struct HomeScrollView: View {
    @EnvironmentObject var user: User
    @State private var startAnimation: Bool = false
    
    var body: some View {
        VStack {
                HStack{
                    Image("longLogoOrange")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130)
                }
                .background(.white)

            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ZStack {
                            Image("spainImage")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                            .padding(20)
                            
//                            HStack {
//                                Text("Hola Amigo")
//                                    .font(textFont(name: "Helvetica-Bold", size: 25))
//                                    .foregroundColor(Color.orangeA)
//                                    .padding(.leading, 20)
//                                Spacer()
//                                Image("Spanish")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .cornerRadius(30)
//                            }
//                            .padding(.horizontal)
//                            .padding(.vertical)
//                            .frame(width: 314, height: 80)
//                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
//                            .background(Color.white.opacity(0.9))
//                            .cornerRadius(10)
//                            .offset(y: -40)

                        }
                            
                        Text("Daily Goals")
                            .foregroundColor(Color.greyText)
                            .font(textFont(name: "Helvetica-Bold", size: 25))
                            .offset(x: -85)
                        
                            DailyGoalListView()
                                .padding(20)
                        
                        Text("Your Words")
                            .offset(x: -90)
                            .font(textFont(name: "Helvetica-Bold", size: 25))
                            .foregroundColor(Color.blackA)
                            .bold()
                        
                    //flashcardpreview
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                            
                            StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
                            
                            StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
                        }
                            .padding(20)
                            
                    }
                        
                    //dailygoal

                    }
                    
                    //stats
                        Text("Your Stats")
                            .foregroundColor(Color.greyText)
                            .font(textFont(name: "Helvetica-Bold", size: 25))
                            .offset(x: -90)
                        
                    ZStack {
                        Rectangle()
                            .frame(height: 200)
                            .foregroundColor(.offWhiteA)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                        //
                        ChartView()
                            .frame(height: 200)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                    }
                    
                }
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

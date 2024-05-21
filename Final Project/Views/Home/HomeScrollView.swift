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
                            .padding(.horizontal, 20)
                            
                    }
                        
                    //dailygoal
                        Text("Daily Goals")
                            .foregroundColor(Color.greyText)
                            .font(textFont(name: "Helvetica-Bold", size: 25))
                            .offset(x: -85)
                        
                        Rectangle()
                            .frame(height: 200)
                            .foregroundColor(.blueA)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                    }
                    
                    //stats
                        Text("Your Stats")
                            .foregroundColor(Color.greyText)
                            .font(textFont(name: "Helvetica-Bold", size: 25))
                            .offset(x: -90)
                        
                    ZStack {
                        Rectangle()
                            .frame(height: 200)
                            .foregroundColor(.pinkA)
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

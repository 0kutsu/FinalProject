//
//  DailyGoalView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/21/24.
//

import SwiftUI

struct DailyGoalView: View {
    var dailyGoal: DailyGoal
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Spacer()
                        dailyGoal.icon
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blueA)
                            .cornerRadius(5)
                    
                        VStack {
                            HStack {
                            Text(dailyGoal.prompt)
                                .font(textFont(name: "helvetica-bold", size: 20))
                                .foregroundColor(.blackA)
                                Spacer()
                            }
                            
                            HStack {
                                Text(dailyGoal.difficulty)
                                    .foregroundColor(.grayA)
                                Spacer()
                            }
                            
                        }
                        .padding(.horizontal)
                    Spacer()
                }
                ZStack {
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(Color.lightGrayA)
                    HStack {
                        Rectangle()
                            .frame(width: 200, height: 10)
                            .foregroundColor(dailyGoal.color)
                        Spacer()
                    }
                }
                .padding(.horizontal, 5)
            }
            .padding()
            .background(.white)
            .cornerRadius(16)
        }
        .shadow(radius: 2, x: 0, y: 1)
//        .padding(5)
//        .background(dailyGoal.color)
//        .cornerRadius(20)

    }
}

struct DailyGoalView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalView(dailyGoal: dailyGoals[0])
    }
}

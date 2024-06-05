//
//  CompletedDailyGoalView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/1/24.
//

import SwiftUI

struct CompletedDailyGoalView: View {
    var dailyGoal: DailyGoal
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.greenA)
                        .cornerRadius(5)
                    
                    VStack {
                        HStack {
                            Text(dailyGoal.prompt)
                                .font(textFont(name: "helvetica-bold", size: 20))
                                .foregroundColor(.greenA)
                            Spacer()
                        }
                        HStack {
                            Text(dailyGoal.difficulty)
                                .foregroundColor(.greenA)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                ZStack {
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(Color.greenA)
                }
                .padding(.horizontal, 5)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
        }
        .shadow(radius: 2, x: 0, y: 1)
        //        .padding(5)
        //        .background(dailyGoal.color)
        //        .cornerRadius(20)
        
    }
}

struct CompletedDailyGoalView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedDailyGoalView(dailyGoal: dailyGoals[0])
    }
}

//
//  DailyGoalView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/21/24.
//

import SwiftUI

struct DailyGoal1View: View {
    @EnvironmentObject var user: User
    var dailyGoal: DailyGoal1
    @State var rectangleWidthIncrement: CGFloat = 0

    var body: some View {
        if user.totalWords >= dailyGoal.wordAmountGoal {
            CompletedDailyGoalView(dailyGoal: dailyGoal)
        }
        else {
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        dailyGoal.icon
                            .foregroundColor(.white)
                            .padding()
                            .background(dailyGoal.color)
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
                                .frame(width: rectangleWidthIncrement*CGFloat(user.totalWords), height: 10)
                                .foregroundColor(dailyGoal.color)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 5)
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
            }
            .shadow(radius: 2, x: 0, y: 1)
            //        .padding(5)
            //        .background(dailyGoal.color)
            //        .cornerRadius(20)
            .onAppear {
                rectangleWidthIncrement = CGFloat(340/dailyGoal.wordAmountGoal)
            }
        }

    }
        
}

struct DailyGoal1View_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoal1View(dailyGoal: dailyGoals[0] as! DailyGoal1)
            .environmentObject(User())
    }
}

//
//  DailyGoal3View.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/2/24.
//

import SwiftUI

struct DailyGoal3View: View {
    @EnvironmentObject var user: User
    var dailyGoal: DailyGoal3
    @State var rectangleWidthIncrement: CGFloat = 0
    var body: some View {
        if user.totalChats >= dailyGoal.chatAmountGoal {
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
                                .frame(width: rectangleWidthIncrement*CGFloat(user.totalChats), height: 10)
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
                rectangleWidthIncrement = CGFloat(340/dailyGoal.chatAmountGoal)
            }
        }
    }
    
}

struct DailyGoal3View_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoal3View(dailyGoal: dailyGoals[2] as! DailyGoal3)
            .environmentObject(User())
    }
}

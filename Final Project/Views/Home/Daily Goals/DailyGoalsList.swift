//
//  DailyGoalsList.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/21/24.
//

import Foundation
import SwiftUI


var dailyGoals: [DailyGoal] = [
    DailyGoal1(icon: Image(systemName: "star.fill"), color: Color.blueA, prompt: "Use 10 new words", difficulty: "Easy", initialTotalWords: 0, wordAmountGoal: 10),
    DailyGoal2(icon: Image(systemName: "square.fill"), color: Color.redA, prompt: "Use 30 words", difficulty: "Medium", initalDifferentWords: 0, wordAmountGoal: 5),
    DailyGoal3(icon: Image(systemName: "circle.fill"), color: Color.pinkA, prompt: "Talk to 5 people", difficulty: "Medium", initialChatTotal: 0, chatAmountGoal: 5)
]

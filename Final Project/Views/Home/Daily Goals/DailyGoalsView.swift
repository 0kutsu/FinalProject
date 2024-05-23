//
//  DailyGoalsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/21/24.
//

import SwiftUI

struct DailyGoalListView: View {
    var body: some View {
        VStack {
            DailyGoalView(dailyGoal: dailyGoals[0])
                .padding(.vertical, 5)
            DailyGoalView(dailyGoal: dailyGoals[1])
                .padding(.vertical, 5)
            DailyGoalView(dailyGoal: dailyGoals[2])
                .padding(.vertical, 5)

        }
    }
}

struct DailyGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalListView()
    }
}

//
//  DailyGoalsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/21/24.
//

import SwiftUI

struct DailyGoalListView: View {
    @EnvironmentObject var user: User
    
    
    var body: some View {
        VStack {
            if let dailyGoal1 = dailyGoals[0] as? DailyGoal1 {
                DailyGoal1View(dailyGoal: dailyGoal1)
                    .padding(.vertical, 5)
            }
            
            if let dailyGoal2 = dailyGoals[1] as? DailyGoal2 {
                DailyGoal2View(dailyGoal: dailyGoal2)
                    .padding(.vertical, 5)
            }
            
            if let dailyGoal3 = dailyGoals[2] as? DailyGoal3 {
                DailyGoal3View(dailyGoal: dailyGoal3)
                    .padding(.vertical, 5)
            }

        }
    }
}

struct DailyGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalListView()
            .environmentObject(User())
    }
}

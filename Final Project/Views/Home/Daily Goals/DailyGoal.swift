//
//  DailyGoal.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/20/24.
//

import Foundation
import SwiftUI

protocol DailyGoal {
    var icon: Image {get set}
    var color: Color {get set}
    var prompt: String {get set}
    var difficulty: String {get set}
    var completed: Bool {get set}
    
}


struct DailyGoal1: Identifiable, DailyGoal {
    var icon: Image
    var color: Color
    var prompt: String
    var difficulty: String
    var completed: Bool = false
    
    var id: String {return prompt}
    
    let initialTotalWords: Int
    let wordAmountGoal: Int
}

struct DailyGoal2: Identifiable, DailyGoal {
    var icon: Image
    var color: Color
    var prompt: String
    var difficulty: String
    var completed: Bool = false
    
    var id: String {return prompt}
    
    let initalDifferentWords: Int
    let wordAmountGoal: Int
}

struct DailyGoal3: Identifiable, DailyGoal {
    var icon: Image
    var color: Color
    var prompt: String
    var difficulty: String
    var completed: Bool = false
    
    var id: String {return prompt}
    
    let initialChatTotal: Int
    let chatAmountGoal: Int
}

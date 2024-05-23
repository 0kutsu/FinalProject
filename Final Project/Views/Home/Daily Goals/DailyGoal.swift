//
//  DailyGoal.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/20/24.
//

import Foundation
import SwiftUI

struct DailyGoal: Identifiable {
    var icon: Image
    var color: Color
    var prompt: String
    var difficulty: String
    
    var id: String {
        return prompt
    }

}

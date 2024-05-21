//
//  ChartData.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/20/24.
//

import Foundation

struct ChartData: Identifiable, Equatable {
    let day: Int
    let wordCount: Int
    
    var id: Int {
        return day
    }
}

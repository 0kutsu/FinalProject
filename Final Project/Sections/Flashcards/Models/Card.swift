//
//  Card.swift
//  Flash Cards
//
//  Created by Griffin Turner (student LM) on 4/9/24.
//

import SwiftUI

struct Card: Identifiable {
    let prompt: String
    let answer: String = ""
    let imageAnswer: Image
    var id = UUID()
    
    static let example = Card(prompt: "Prompt", imageAnswer: Image("defaultImage"))
}

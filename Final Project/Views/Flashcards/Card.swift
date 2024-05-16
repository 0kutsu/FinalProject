//
//  Card.swift
//  Flash Cards
//
//  Created by Griffin Turner (student LM) on 4/9/24.
//

import Foundation

struct Card: Codable, Identifiable {
    let prompt: String
    let answer: String
    var id = UUID()
    
    static let example = Card(prompt: "Who is coolest character on the big bang theory?", answer: "Sheldon Cooper")
}

//
//  Card.swift
//  Flash Cards
//
//  Created by Griffin Turner (student LM) on 4/9/24.
//

import Foundation

struct Card: Codable, Identifiable {
    let id = UUID()
    var prompt: String
    var answer: String
 // Add this property
    
    static let example = Card(prompt: "Who is coolest character on the big bang theory?", answer: "Sheldon Cooper")
}

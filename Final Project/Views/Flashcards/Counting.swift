//
//  Card.swift
//  Flash Cards
//
//  Created by Griffin Turner (student LM) on 4/9/24.
//

import Foundation

struct Counting: Codable {
 var Correct: Int
var Wrong: Int
    
    static let example = Counting(Correct: 0, Wrong: 0)
}

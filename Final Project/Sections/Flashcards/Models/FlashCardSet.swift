//
//  FlashCardSet.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import Foundation
import SwiftUI

class FlashCardSet: ObservableObject, Identifiable {
    var name: String
    var description: String
    var image: Image = Image("defaultImage")
    var cards: [Card]
    let id = UUID()
    init(name: String, description: String, image: Image, cards: [Card]) {
        self.name = name
        self.description = description
        self.image = image
        self.cards = cards
    }
}

let flashCardSetExample = FlashCardSet(name: "Name", description: "Description", image: Image("defaultImage"), cards: [Card(prompt: "???", imageAnswer: Image("defaultImage")), Card(prompt: "???", imageAnswer: Image("defaultImage"))])

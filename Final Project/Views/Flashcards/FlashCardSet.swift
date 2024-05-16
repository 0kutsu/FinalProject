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
    var image: Image = Image("")
    var cards: [Card]
    let id = UUID()
    init(name: String, description: String, cards: [Card]) {
        self.name = name
        self.description = description
        self.cards = cards
    }
}

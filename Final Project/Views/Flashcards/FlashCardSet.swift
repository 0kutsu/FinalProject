//
//  FlashCardSet.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import Foundation

class FlashCardSet: ObservableObject, Identifiable {
    var name: String
    var cards: [Card]
    let id = UUID()
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
    }
}

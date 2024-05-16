//
//  FlashCardNavigatorView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/15/24.
//

import SwiftUI
enum FlashCardScreen {
    case flashCardSetsView, flashCardSetInfoView, flashCardStudyView
}
struct FlashCardNavigatorView: View {
    @State var currentFlashCardSet: FlashCardSet = FlashCardSet(name: "", description: "", cards: [Card]())
    @State var flashCardScreen: FlashCardScreen = .flashCardSetsView
        
    var body: some View {
        if flashCardScreen == .flashCardSetsView {
            FlashCardSetsView(currentFlashCardSet: $currentFlashCardSet, flashCardScreen: $flashCardScreen)
        }
        else if flashCardScreen == .flashCardSetInfoView {
            FlashCardSetInfoView(currentFlashCardSet: $currentFlashCardSet, flashCardScreen: $flashCardScreen)
        }
        else if flashCardScreen == .flashCardStudyView {
            FlashCardStudyView(currentFlashCardSet: $currentFlashCardSet, flashCardScreen: $flashCardScreen)
        }
        
    }
}

struct FlashCardNavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardNavigatorView()
    }
}

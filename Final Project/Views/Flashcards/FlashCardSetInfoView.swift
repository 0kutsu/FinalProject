//
//  FlashCardSetsInfoView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/7/24.
//

import SwiftUI

struct FlashCardSetInfoView: View {
    @Binding var currentFlashCardSet: FlashCardSet
    @Binding var flashCardScreen: FlashCardScreen
    var body: some View {
        VStack {
            HStack {
                Button {
                    flashCardScreen = .flashCardSetsView
                } label: {
                    Text("Back")
                }
                
                .padding()
                Button {
                    flashCardScreen = .flashCardStudyView
                } label: {
                    Text("Study")
                }
                
                .padding()
                Spacer()
            }
            ScrollView(showsIndicators: false) {
                Text("\(currentFlashCardSet.name)")
                    .bold()
                Text("\(currentFlashCardSet.description)")
                
                ForEach(currentFlashCardSet.cards) { card in
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                        HStack {
                            Text("\(card.prompt)")
                            Text("\(card.answer)")
                        }
                    }
                }
            }
        }
    }
}

struct FlashCardSetInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSetInfoView(currentFlashCardSet: Binding.constant(flashCardSetExample), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetInfoView))
    }
}

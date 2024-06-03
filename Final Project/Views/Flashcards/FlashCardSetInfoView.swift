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
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(Color.orangeA)
                }
                
                .padding()
                Spacer()
                
                Button {
                    flashCardScreen = .flashCardStudyView
                } label: {
                    HStack {
                        ZStack {
                            Text("Study")
                                .bold()
                                .font(textFont(name: "helvetica", size: 20))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .foregroundColor(Color.orangeA)
                                .background(Color.white)
                                .cornerRadius(30)
                        }
                        .shadow(radius: 2, y: 1)
                    }
                }
                
                .padding()
               
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

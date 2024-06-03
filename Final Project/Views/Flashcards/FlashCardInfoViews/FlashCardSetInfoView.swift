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
            // navigation
            HStack {
                Button {
                    flashCardScreen = .flashCardSetsView
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .bold()
                        .frame(width: 10, height: 20)
                        .foregroundColor(Color.orangeA)
                }
                Spacer()
                Button {
                    
                } label: {
                    Button {
                        flashCardScreen = .flashCardStudyView
                    } label: {
                        
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .frame(width: 25, height: 7)
                                    .foregroundColor(Color.orangeA)
                    }
                }
            }
            .padding(20)
            
            // set description
            HStack {
                currentFlashCardSet.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(10)
                VStack {
                    HStack {
                        Text("\(currentFlashCardSet.name)")
                            .font(textFont(name: "helvetica-bold", size: 30))
                            .foregroundColor(Color.blackA)
                        Spacer()
                    }
                    HStack {
                        Text("\(currentFlashCardSet.description)")
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(Color.blackA)
                        Spacer()
                    }
                }
                .padding(.leading, 10)
                Spacer()
            }
            .padding(20)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(currentFlashCardSet.cards) { card in
                            CardInfoView(card: card)
                                .padding(10)
                        }
                    }
                    .padding(10)
                }
            }
            Spacer()
            Button {
                flashCardScreen = .flashCardStudyView
            } label: {
                    ZStack {
                        Text("Study")
                            .bold()
                            .font(textFont(name: "helvetica", size: 20))
                            .padding(.vertical, 20)
                            .padding(.horizontal, 40)
                            .foregroundColor(Color.white)
                            .background(Color.orangeA)
                            .cornerRadius(30)
                    }
                    .shadow(radius: 2, y: 1)
            }
            .padding(20)
        }
    }
}

struct FlashCardSetInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSetInfoView(currentFlashCardSet: Binding.constant(flashCardSetExample), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetInfoView))
    }
}

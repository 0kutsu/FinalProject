//
//  FlashCardSetView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/23/24.
//

import SwiftUI
import Foundation

struct FlashCardSetView: View {
    @State var flashCardSet: FlashCardSet
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    flashCardSet.image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                            .cornerRadius(5)
                    
                        VStack {
                            HStack {
                                Text(flashCardSet.name)
                                .font(textFont(name: "helvetica-bold", size: 20))
                                .foregroundColor(.blackA)
                                Spacer()
                            }
                            
                            HStack {
                                Text("\(flashCardSet.cards.count) cards")
                                    .foregroundColor(.grayA)
                                Spacer()
                            }
                            
                        }
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(20)
        }
        .shadow(radius: 2, x: 0, y: 1)
    }
}

struct FlashCardSetView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSetView(flashCardSet: flashCardSetExample)
           
    }
}



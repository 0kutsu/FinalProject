//
//  FlashCardSetsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import SwiftUI



struct FlashCardSetsView: View {
    @Binding var currentFlashCardSet: FlashCardSet
    @Binding var flashCardScreen: FlashCardScreen
    @EnvironmentObject var user: User
    var body: some View {
            VStack {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Text("Sets")
                            .font(.system(size: 40))
                            .foregroundColor(Color.orangeMain)
                            .padding(.horizontal, 30)
                            .padding()
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.orange)
                                    .frame(height: 100)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 30)
                                
                                Text("Create Set")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.black)
                                
                            }
                        }
                    }
                    ForEach(user.flashCardSets) { flashCardSet in
                        Button {
                            currentFlashCardSet = flashCardSet
                            flashCardScreen = .flashCardSetInfoView
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.orange)
                                    .frame(height: 100)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 30)
                                HStack {
                                    Rectangle() // this will be an image later
                                        .foregroundColor(Color.white)
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(20)
                                        .padding(.trailing, 10)
                                    VStack(alignment: .leading) {
                                        Text(flashCardSet.name)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20))
                                            .fontWeight(.black)
                                        
                                        Text("\(flashCardSet.cards.count) Cards")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    Spacer()
                                }
                                .padding(.leading, 60)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
}

struct FlashCardSetsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSetsView(currentFlashCardSet: Binding.constant(FlashCardSet(name: "Name", description: "Description", cards: [Card(prompt: "???", answer: "Answer"), Card(prompt: "???", answer: "Answer"), Card(prompt: "???", answer: "Answer")])), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetsView))
            .environmentObject(User())
    }
}

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
                HStack {
//                    Image(uiImage: user.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 40)
//                        .cornerRadius(20)
//                        .padding(.trailing)
                    
                    Text("Your Sets")
                        .font(textFont(name: "helvetica-bold", size: 30))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Button {
                        flashCardScreen = .createFlashCardSetView
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(height: 30)
                            .bold()
                    }
                    
                }
                .padding(20)
                .background(Color.blueA)
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(user.flashCardSets) { flashCardSet in
                        Button {
                            currentFlashCardSet = flashCardSet
                            flashCardScreen = .flashCardSetInfoView
                        } label: {
                            FlashCardSetView(flashCardSet: flashCardSet)
                                .padding(.horizontal, 20)
                                .padding(.top, 1)
        
                        }
                    }
                }
                
                Spacer()
            }
        }
}

struct FlashCardSetsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSetsView(currentFlashCardSet: Binding.constant(flashCardSetExample), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetsView))
            .environmentObject(User())
    }
}

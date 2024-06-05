//
//  AddCardToSetView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/29/24.
//

import SwiftUI


func isIncluded(flashCardSet: FlashCardSet, selectedFlashCardSets: [FlashCardSet]) -> Bool {
    let isIncluded = selectedFlashCardSets.contains { element in
        if element.name == flashCardSet.name {
            return true
        }
        else {
            return false
        }
    }
    return isIncluded
}

// adds the flashcardset if it is not selected, unselects it if it is
func addOrRemoveSet(flashCardSet: FlashCardSet, selectedFlashCardSets: inout [FlashCardSet]) {
    if isIncluded(flashCardSet: flashCardSet, selectedFlashCardSets: selectedFlashCardSets) {
        selectedFlashCardSets.removeAll {
            $0.name == flashCardSet.name
        }
    }
    
    else {
        selectedFlashCardSets.append(flashCardSet)
    }
}

struct AddCardToSetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var user: User
    @State var selectedFlashCardSets: [FlashCardSet] = []
    
    @State var prompt: String
    @State var imageAnswer: Image
    @Binding var showingAddCardToSetView: Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(Color.white)
                    }
                    
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("Add to Set")
                        .font(textFont(name: "helvetica-bold", size: 20))
                        .foregroundColor(Color.white)
                        .padding(20)
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            .background(Color.orangeA)
            
            
            
            ScrollView(showsIndicators: false) {
                ForEach(user.flashCardSets) { flashCardSet in
                    Button {
                        addOrRemoveSet(flashCardSet: flashCardSet, selectedFlashCardSets: &selectedFlashCardSets)
                        
                    } label: {
                        if isIncluded(flashCardSet: flashCardSet, selectedFlashCardSets: selectedFlashCardSets) {
                            SelectedFlashCardSetView(flashCardSet: flashCardSet)
                                .padding(.horizontal, 20)
                                .padding(.top, 1)
                        }
                        else {
                            UnselectedFlashCardSetView(flashCardSet: flashCardSet)
                                .padding(.horizontal, 20)
                                .padding(.top, 1)
                        }
                    }
                }
            }
            
            
                Button {
                    for i in 0..<selectedFlashCardSets.count {
                        selectedFlashCardSets[i].cards.append(Card(prompt: prompt, imageAnswer: imageAnswer))
                    }
                    dismiss()
                } label: {
                Text("Add")
                    .font(textFont(name: "helvetica-bold", size: 20))
                    .foregroundColor(Color.white)
                    .padding(20)
                    .padding(.horizontal, 40)
                    .background(Color.orangeA, in: RoundedRectangle.init(cornerRadius: 30))
                    
            }
        }
    }
}

struct AddCardToSetView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardToSetView(prompt: "", imageAnswer: Image(""), showingAddCardToSetView: Binding.constant(true))
            .environmentObject(User())
    }
}

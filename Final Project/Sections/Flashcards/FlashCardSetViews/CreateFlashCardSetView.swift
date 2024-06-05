//
//  CreateFlashCardSetView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/7/24.
//

//
//  EditCards.swift
//  Flash Cards
//
//  Created by Griffin Turner (student LM) on 4/9/24.
//
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

struct CreateFlashCardSetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var user: User
    @EnvironmentObject var serpApiService: SerpApiService
    
    @State private var cards = [Card]()
    @State private var setName = ""
    @State private var setDescription = ""
    
    @State private var image: Image = Image("defaultImage")
    @State private var uiImage = UIImage()
    
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    @State private var newImageAnswer = Image("")
    @State var showSheet = false
    
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
            }
            .padding(20)
            
            // set description
            HStack {
                Button {
                    showSheet.toggle()
                } label: {
                    ZStack {
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                    }
                }
                
                VStack {
                    HStack {
                        UnderLineTextFieldView(text: $setName,  textDescription: "Set name", secureField: false, size: 20, defaultLineColor: Color.lightGrayA, activeLineColor: Color.orangeA, lineThickness: 2)
                            
                    }
                    .padding(.bottom, 10)
                    HStack {
                        UnderLineTextFieldView(text: $setDescription,  textDescription: "Set description", secureField: false, size: 20, defaultLineColor: Color.lightGrayA, activeLineColor: Color.orangeA, lineThickness: 2)
                    }
                }
                .padding(.leading, 10)
                Spacer()
            }
            .padding(20)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CreateCardView(prompt: $newPrompt, image: $newImageAnswer, action: addCard)
                            .padding(10)
                            .padding(.bottom, 100)
                        
                        ForEach(cards) { card in
                            CardInfoView(card: card)
                                .padding(10)
                                .padding(.bottom, 100)

                        }
                    }
                    .padding(10)
                }
            }
            Spacer()
            Button {
                done()
                flashCardScreen = .flashCardSetInfoView
            } label: {
                ZStack {
                    Text("Create Set")
                        .bold()
                        .font(textFont(name: "helvetica", size: 20))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                        .foregroundColor(Color.white)
                        .background(setName == "" || setDescription == "" || cards.isEmpty ? Color.orangeA.opacity(25) : Color.orangeA)
                        .cornerRadius(30)
                }
                .shadow(radius: 2, y: 1)
                .disabled(setName == "" || setDescription == "" || cards.isEmpty)
            }
            .padding(20)
        }
        .sheet(isPresented: $showSheet, onDismiss: {
            image = Image(uiImage: uiImage)
            
        }, content: {
            ImagePicker(selectedImage: $uiImage)
        })
    }
    
    func back() {
        cards = [Card]()
        setName = ""
        setDescription = ""
        newPrompt = ""
        image = Image("")
        newAnswer = ""
        dismiss()
    }
    
    func done() {
        user.flashCardSets.append(FlashCardSet(name: setName, description: setDescription, image: image, cards: cards))
        currentFlashCardSet = FlashCardSet(name: setName, description: setDescription, image: image, cards: cards)
        flashCardScreen = .flashCardSetInfoView
    }
    
//    func loadData() {
//        if let data = UserDefaults.standard.data(forKey: "Cards") {
//            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
//                cards = decoded
//            }
//        }
//    }
//
//    func saveData() {
//        if let data = try? JSONEncoder().encode(cards) {
//            UserDefaults.standard.set(data, forKey: "Cards")
//        }
//    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
//        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
//        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        // TEMPORARY THIS IS WHAT NEEDS TO CHANGE
        let card = Card(prompt: trimmedPrompt, imageAnswer: newImageAnswer)
        // // //
        
        cards.insert(card, at: 0)
        
        newPrompt = ""
        newImageAnswer = Image("")
        serpApiService.images = []
//        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
//        saveData()
    }
}

struct CreateFlashCardSetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlashCardSetView(currentFlashCardSet: Binding.constant(flashCardSetExample), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetInfoView))
            .environmentObject(User())
            .environmentObject(SerpApiService())
    }
        
}

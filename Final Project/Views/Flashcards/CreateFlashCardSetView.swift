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

struct CreateFlashCardSetView: View {
   @Environment(\.dismiss) var dismiss
   @EnvironmentObject var user: User
   @State private var cards = [Card]()
   @State private var images = [String]()
   @State private var setName = ""
   @State private var setDescription = ""
   @State private var image = Image("")
   @State private var newPrompt = ""
   //@State private var newAnswer = ""
   @StateObject var serpApiService = SerpApiService()
   let apiKey = "27acff5d24141365418bb480c51944d351601db4dd35ba99143fb4acec031004"
   
   @Binding var currentFlashCardSet: FlashCardSet
   @Binding var flashCardScreen: FlashCardScreen
   

   var body: some View {
       NavigationView {
           List {
               Section("Set Description") {
                   TextField("Name", text: $setName)
                   TextField("Description", text: $setDescription)
               }
               
               Section("Add new card") {
                   TextField("Prompt", text: $newPrompt)
                   //TextField("Answer", text: $newAnswer)
                   Button("Add card", action: addCard)
               }

               Section {
                   ForEach(0..<cards.count, id: \.self) { index in
                       VStack(alignment: .leading) {
                           Text(cards[index].prompt)
                               .font(.headline)
                           FlashCardImageView(imageURL: $images[index])
                           //FlashCardImageView(images: $serpApiService.images)
                           
                           //Text(cards[index].answer)
                              // .foregroundColor(.secondary)
                       }
                   }
                   .onDelete(perform: removeCards)
               }
           }
           .navigationTitle("New Set")
           .toolbar {
               Button("Back", action: back)
               Button("Done", action: done)
               
           }
           .listStyle(.grouped)
           .onAppear(perform: loadData)
       }
   }
   
   func back() {
       cards = [Card]()
       setName = ""
       setDescription = ""
       newPrompt = ""
       image = Image("")
       //newAnswer = ""
       dismiss()
   }
   
   func done() {
       user.flashCardSets.append(FlashCardSet(name: setName, description: setDescription, image: image, cards: cards))
       currentFlashCardSet = FlashCardSet(name: setName, description: setDescription, image: image, cards: cards)
       flashCardScreen = .flashCardSetInfoView
   }

   func loadData() {
       if let data = UserDefaults.standard.data(forKey: "Cards") {
           if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
               cards = decoded
           }
       }
   }

   func saveData() {
       if let data = try? JSONEncoder().encode(cards) {
           UserDefaults.standard.set(data, forKey: "Cards")
       }
   }

   func addCard() {
       let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
       //let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
       guard trimmedPrompt.isEmpty == false else { return }
       serpApiService.fetchImages(query: trimmedPrompt)
       images.insert("https://serpapi.com/search?engine=google_images&q=\(trimmedPrompt)&num=10&api_key=\(apiKey)", at: 0)
       let card = Card(prompt: trimmedPrompt, answer: "")
       cards.insert(card, at: 0)
       saveData()
   }
   
   func removeCards(at offsets: IndexSet) {
       cards.remove(atOffsets: offsets)
       saveData()
   }
}

struct CreateFlashCardSetView_Previews: PreviewProvider {
   static var previews: some View {
       CreateFlashCardSetView(currentFlashCardSet: Binding.constant(flashCardSetExample), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetInfoView))
           .environmentObject(User())
   }
}


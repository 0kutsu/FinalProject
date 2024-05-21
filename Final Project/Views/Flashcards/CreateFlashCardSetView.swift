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
    @State private var setName = ""
    @State private var setDescription = ""
    @State private var newPrompt = ""
    @State private var newAnswer = ""

    var body: some View {
        NavigationView {
            List {
                Section("Set Description") {
                    TextField("Name", text: $newPrompt)
                    TextField("Description", text: $newAnswer)
                }
                
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }

                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)

                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
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
        newAnswer = ""
        dismiss()
    }
    
    func done() {
        user.flashCardSets.append(FlashCardSet(name: setName, description: setDescription, cards: cards))
        dismiss()
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
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
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
        CreateFlashCardSetView()
            .environmentObject(User())
    }
}

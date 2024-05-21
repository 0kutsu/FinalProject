//
//  EditCards.swift
//  Flash Cards
//
//  Created by Griffin Turner (student LM) on 4/9/24.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var currentFlashCardSet: FlashCardSet
    @State private var newPrompt = ""
    @State private var newAnswer = ""

    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }

                Section {
                    ForEach(0..<currentFlashCardSet.cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(currentFlashCardSet.cards[index].prompt)
                                .font(.headline)

                            Text(currentFlashCardSet.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }

    func done() {
        dismiss()
    }

    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                currentFlashCardSet.cards = decoded
            }
        }
    }

    func saveData() {
        if let data = try? JSONEncoder().encode(currentFlashCardSet.cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }

    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        currentFlashCardSet.cards.insert(card, at: 0)
        saveData()
    }

    func removeCards(at offsets: IndexSet) {
        currentFlashCardSet.cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCardsView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardsView(currentFlashCardSet: Binding.constant(FlashCardSet(name: "Name", description: "Description", cards: [Card(prompt: "???", answer: "Answer"), Card(prompt: "???", answer: "Answer"), Card(prompt: "???", answer: "Answer")])))
    }
}

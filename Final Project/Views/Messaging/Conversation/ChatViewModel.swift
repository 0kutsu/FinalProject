//
//  ChatViewModel.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    @Published var mockData = [
        Message(userUid: "12345", text: "text, texting", createdAt: Date()),
        Message(userUid: "12345", text: "text message, text message, text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message, texting, text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message, text message", createdAt: Date()),
        Message(userUid: "12345", text: "texting", createdAt: Date()),
        Message(userUid: "12345", text: "text", createdAt: Date()),
        Message(userUid: "12345", text: "text message, text message, text message", createdAt: Date()),
        Message(userUid: "12345", text: "txt", createdAt: Date())
    ]
    func sendMessage(text: String) {
        print(text)
    }
}

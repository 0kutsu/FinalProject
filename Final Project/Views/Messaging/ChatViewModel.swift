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
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date()),
        Message(userUid: "12345", text: "text message", createdAt: Date())
    ]
    func sendMessage(text: String) {
        print(text)
    }
}

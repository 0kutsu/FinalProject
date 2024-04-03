//
//  Message.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import Foundation
import Firebase

let db = Database.database().reference()

struct Message: Codable, Identifiable {
    let userUid: String
    let text: String
    let createdAt: Date
    let id = UUID()
    
    static func uploadMessage(_ message: Message) {
        do {
            // Convert the message object to JSON data
            let jsonData = try JSONEncoder().encode(message)
            
            // Convert JSON data to a dictionary
            guard let messageDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
                print("Error converting JSON data to dictionary")
                return
            }
            
            // Generate a unique key for the new message
            let messageRef = db.child("section").childByAutoId()
            
            // Upload the message data to Firebase Realtime Database
            messageRef.setValue(messageDict) { error, _ in
                if let error = error {
                    print("Error adding message: \(error)")
                } else {
                    print("Message added successfully!")
                }
            }
        } catch {
            print("Error encoding message: \(error)")
        }
    }
    
    static func fetchMessages(completion: @escaping ([Message]) -> Void) {
        
    }
    
    func isFromCurrentUser() -> Bool {
        guard let user = Auth.auth().currentUser else {
            return false // If no user is logged in, consider it's not from the current user
        }
        return user.uid == userUid
    }
}







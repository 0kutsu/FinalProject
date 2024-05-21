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
    
    static func fetchMessages(completion: @escaping (Result<[Message], Error>) -> Void) {
        let messageRef = db.child("section")
        
        // Observing for changes in the data at the specified database reference
        messageRef.observe(.value) { snapshot in
            guard snapshot.exists() else {
                completion(.success([])) // If there are no messages, return an empty array
                return
            }
            
            var messages: [Message] = []
            
            for child in snapshot.children {
                // Convert each child snapshot to a dictionary
                guard let snapshot = child as? DataSnapshot,
                      let messageDict = snapshot.value as? [String: Any] else {
                    continue
                }
                
                // Deserialize the dictionary to a Message object
                if let messageData = try? JSONSerialization.data(withJSONObject: messageDict),
                   let message = try? JSONDecoder().decode(Message.self, from: messageData) {
                    messages.append(message)
                }
            }
            
            // Sort messages by createdAt date
            messages.sort { $0.createdAt < $1.createdAt }
            
            completion(.success(messages))
        } withCancel: { error in
            completion(.failure(error)) // If there's an error, pass it through the completion handler
        }
    }
    
    func isFromCurrentUser() -> Bool {
        guard let user = Auth.auth().currentUser else {
            return false // If no user is logged in, consider it's not from the current user
        }
        return user.uid == userUid
    }
}







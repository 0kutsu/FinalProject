//
//  Message.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import Foundation

struct Message: Decodable, Identifiable {
    let id = UUID()
    let userUid: String
    let text: String
    let photoURL: String
    let createdAt: Date
    
    func isFromCurrentUser() -> Bool {
        return false
    }
}

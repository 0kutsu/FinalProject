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
    let createdAt: Date
    
//    enum CodingKeys: String, CodingKeys {
//        case id
//        case userUid
//        case text
//        case photoURL
//        case createdAt
//    }
//
    
    func isFromCurrentUser() -> Bool {
        return false
    }
}

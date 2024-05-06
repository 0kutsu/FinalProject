//
//  User.swift
//  Wordle
//
//  Created by Mati Okutsu (student LM)
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class User: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var username: String = ""
    @Published var language: Language = Language(name: "", nativeName: "")
    @Published var learningLevel: String = "New"
    
    // statistics
    @Published var totalWords: Int = 0
    @Published var individualWords: Int = 0
    
    @Published var image: UIImage = UIImage(imageLiteralResourceName: "profilePicture")
    @Published var loggedIn: Bool = false
    
    
    
    
    @Published var uid: String = ""
    
    // initializing with sets is temporary
    @Published var flashCardSets: [FlashCardSet] = [FlashCardSet(name: "Hard Words", cards: [Card]()), FlashCardSet(name: "Mid Words", cards: [Card]()), FlashCardSet(name: "Easy Words", cards: [Card]())]
    
    init(email: String = "", password: String = "", username: String = "") {
        self.email = email
        self.password = password
        
        // Check if user is already logged in
//        if let currentUser = Auth.auth().currentUser {
//            self.email = currentUser.email ?? ""
//            self.uid = currentUser.uid
//            self.loggedIn = true
//        }
    }
    
    // Sign up function
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
                return
            }
            
            // Sign up successful
            self.loggedIn = true
            self.uid = authResult?.user.uid ?? ""
        }
    }
    
    // Sign in function
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
            // Sign in successful
            self.loggedIn = true
            self.uid = authResult?.user.uid ?? ""
        }
    }
    
    // Sign out function
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.loggedIn = false
            self.uid = ""
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}

//
//  SignupView.swift
//  Wordle
//
//  Created by Mati Okutsu (student LM) on 2/6/24.
//

import FirebaseAuth
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    
    var body: some View {
        VStack {
            Spacer()
            Image("wordle logo")
                .resizable()
                .scaledToFit()
                .padding(.all, 30)
                .frame(width: 300, height: 300)
            
            TextField("Email Address", text: $user.email)
                .padding()
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $user.password)
                .padding()
            
            Spacer()
            
            Button(action: signUp) {
                Text("Sign Up")
                    .padding(.vertical, 10)
                    .frame(width: 300)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .disabled(user.email.isEmpty || user.password.isEmpty)
            }
            
            Button(action: signIn) {
                Text("Log In")
                    .padding(.vertical, 10)
                    .frame(width: 300)
                    .background(user.loggedIn ? Color.black : Color.white)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            
            Button(action: signOut) {
                Text("Sign Out")
                    .padding(.vertical, 10)
                    .frame(width: 300)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .opacity(user.loggedIn ? 1.0 : 0.0)
                    .disabled(!user.loggedIn)
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func signUp() {
        user.signUp()
    }
    
    func signIn() {
        user.signIn()
    }
    
    func signOut() {
        user.signOut()
    }
}

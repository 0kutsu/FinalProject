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
            Image("logoImage")
                .resizable()
                .scaledToFit()
                .padding(.all, 50)
                .frame(width: 300, height: 300)
            
            TextField("Email Address", text: $user.email)
                .padding()
                .padding(.top, 30)
                .padding(.leading, 30)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $user.password)
                .padding()
                .padding(.leading, 30)
                .padding(.bottom, 30)
            
            
            
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
                    .background(Color.black)
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
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView(screen: Binding.constant(.userView))
                .environmentObject(User())
        }
}

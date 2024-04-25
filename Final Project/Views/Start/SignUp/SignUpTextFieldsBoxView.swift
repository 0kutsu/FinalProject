//
//  SignUpTextFieldsBoxView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import SwiftUI

struct SignUpTextFieldsBoxView: View {
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    var body: some View {
        VStack {
            Text("Username")
                .padding(.top, 40)
                .padding(.trailing, 210)
                .foregroundColor(Color.orangeMain)
            TextField("", text: $user.username)
                .textFieldStyle(.roundedBorder)
                .border(Color.orangeMain)
                .frame(width: 290)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.bottom, 20)
                .padding(.horizontal, 30)
            
            Text("Email Address")
                .padding(.trailing, 180)
                .foregroundColor(Color.orangeMain)
            TextField("", text: $user.email)
                .textFieldStyle(.roundedBorder)
                .border(Color.orangeMain)
                .frame(width: 290)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.bottom, 20)
            
            Text("Password")
                .padding(.trailing, 210)
                .foregroundColor(Color.orangeMain)
            
            SecureField("", text: $user.password)
                .textFieldStyle(.roundedBorder)
                .border(Color.orangeMain)
                .frame(width: 290)
                .padding(.bottom, 40)
            
            Button {
                signUp()
//                screen = .chooseLanguageView
                
            } label: {
                Text("Create Account")
                    .padding(.vertical, 10)
                    .frame(width: 290)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .disabled(user.email.isEmpty || user.password.isEmpty)
                    .bold()
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.orangeMain)
                    .opacity(0.5)
                Image(systemName: "triangle.fill")
                    .foregroundColor(Color.orangeMain)
                    .opacity(0.4)
                Image(systemName: "square.fill")
                    .foregroundColor(Color.orangeMain)
                    .opacity(0.3)
            }
            .padding()
            .padding(.bottom, 40)
            
            HStack {
                Text("Already have an account?")
                
                Button {
                    screen = .logInView
                } label: {
                    Text("Log In")
                        .foregroundColor(.orange)
                }
            }
            .padding(.bottom, 30)
        }
        .background(Color.white)
        .cornerRadius(30)
        .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
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

struct SignUpTextFieldsBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldsBoxView(screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

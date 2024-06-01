//
//  SignUpTextFieldsBoxView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import SwiftUI

struct SignUpTextFieldsBoxView: View {
    @State var backgroundOpacity: Double
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    var body: some View {
        
        
            VStack {
                VStack {
                    HStack {
                        Text("Username")
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(Color.orangeA)
                        Spacer()
                    }
                    TextField("", text: $user.username)
                        .textFieldStyle(.roundedBorder)
                        .border(Color.orangeA)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.bottom, 20)
                    
                    
                    HStack {
                        Text("Email Address")
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(Color.orangeA)
                        Spacer()
                    }
                    TextField("", text: $user.email)
                        .border(Color.orangeA)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.bottom, 20)
                    
                    
                    HStack {
                        Text("Password")
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(Color.orangeA)
                        Spacer()
                    }
                    
                    SecureField("", text: $user.password)
                        .textFieldStyle(.roundedBorder)
                        .border(Color.orangeA)
                        .padding(.bottom, 40)
                    
                }
                .padding(.horizontal, 40)
                
                
                Button {
    //                signUp()
                    screen = .chooseLanguageView
                    
                } label: {
                    Text("Create Account")
                        .font(textFont(name: "helvetica", size: 20))
                        .padding(.vertical, 10)
                        .frame(width: 290)
                        .background(Color.orangeA)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .disabled(user.email.isEmpty || user.password.isEmpty)
                        .shadow(radius: 2, y: 1)
                }
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color.orangeA)
                        .opacity(0.5)
                    Image(systemName: "triangle.fill")
                        .foregroundColor(Color.orangeA)
                        .opacity(0.4)
                    Image(systemName: "square.fill")
                        .foregroundColor(Color.orangeA)
                        .opacity(0.3)
                }
                .padding(20)
                .padding(.bottom, 20)
                
                VStack {
                    Text("Already have an account?")
                        .font(textFont(name: "helvetica", size: 20))
                        .foregroundColor(Color.blackA)

                    
                    Button {
                        screen = .logInView
                    } label: {
                        Text("Log In")
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(.orangeA)
                    }
                }
            }
            .padding(.vertical, 40)
                .background(Color.white)
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
        SignUpTextFieldsBoxView(backgroundOpacity: 1, screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

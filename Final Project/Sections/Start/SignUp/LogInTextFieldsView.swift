//
//  LogInTextFieldsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import SwiftUI

//
//  SignUpTextFieldsBoxView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import SwiftUI

struct LogInTextFieldsView: View {
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.system(size: 50))
                .fontWeight(.black)
                .foregroundColor(Color.orangeMain)
                .padding(.trailing, 50)
                .padding(.top, 80)
                .padding(.bottom, 30)
            
            
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
            
            Button(action: signIn) {
                Text("Log In")
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
            VStack {
                Text("Don't have an account?")
                
                Button {
                    screen = .signUpView
                } label: {
                    Text("Create Account")
                        .foregroundColor(.orange)
                }
            }
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

struct LogInTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        LogInTextFieldsView(screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

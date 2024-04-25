//
//  SignupView.swift
//  Wordle
//
//  Created by Mati Okutsu (student LM) on 2/6/24.
//

import FirebaseAuth
import SwiftUI

struct LogoAndButtonView: View {
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    @State private var startAnimation: Bool = false
    public var x:CGFloat = 150
    public var y:CGFloat = 100
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .orangeMain,
                    .orange],
                startPoint: startAnimation ? .topLeading : .bottomLeading,
                endPoint: startAnimation ? .bottomTrailing : .topTrailing
            ).onAppear {
                withAnimation(.linear(duration: 5.0).repeatForever()) {
                    startAnimation.toggle()
                }
            }
                   .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                Image("appLogoTransparent")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(width: 475, height: 500)
                
                Spacer()
                
                
                
                Button {
                    screen = .signUpView
                } label: {
                        HStack {
                            Text("Get Started")
                            Image(systemName: "arrow.right")
                        }
                            .font(.system(size: 30))
                            .fontWeight(.black)
                            .padding()
                            .frame(width: 300)
                            .background(Color.white)
                            .foregroundColor(Color.orange)
                            .cornerRadius(30)
                        .disabled(user.email.isEmpty || user.password.isEmpty)
                        
                        // background color gradient
                }
                Spacer()
            }
//            .background(Color.orangeMain)
        .edgesIgnoringSafeArea(.all)
        }
    }
}
    
    struct LogoAndButtonView_Previews: PreviewProvider {
        static var previews: some View {
            LogoAndButtonView(screen: Binding.constant(.userView))
                .environmentObject(User())
        }
}

//
//  SignupView.swift
//  Wordle
//
//  Created by Mati Okutsu (student LM) on 2/6/24.
//

import FirebaseAuth
import SwiftUI

import SwiftUI

struct LogoAndButtonView: View {
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    @State private var startAnimation: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .orangeA,
                    .pinkA],
                startPoint: startAnimation ? .topLeading : .bottomLeading,
                endPoint: startAnimation ? .bottomTrailing : .topTrailing
            ).onAppear {
                withAnimation(.linear(duration: 10).repeatForever()) {
                    startAnimation.toggle()
                }
            }
            .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                Image("appLogoTransparent")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                
                Spacer()
                
                Button {
                    screen = .signUpView
                } label: {
                    HStack {
                        Text("Get Started")
                            .font(textFont(name: "helvetica-bold", size: 30))
                            .foregroundColor(.clear) // Hide original text color
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.orangeA, .pinkA]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .mask(Text("Get Started")
                                        .font(textFont(name: "helvetica-bold", size: 30))
                                        .foregroundColor(.white)
                                )
                            )
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                    .background(Color.white)
                    .cornerRadius(40)
                }
                .shadow(radius: 2, y: 1)
                
                Spacer()
            }
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

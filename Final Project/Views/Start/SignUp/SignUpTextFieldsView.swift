//
//  SignUpTextFieldsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/20/24.
//

import SwiftUI

struct SignUpTextFieldsView: View {
    @EnvironmentObject var user: User
    @Binding var screen: Screen
    @State private var startAnimation: Bool = false
    public var x:CGFloat = 150
    public var y:CGFloat = 100
    
    var body: some View {
        
        ZStack {
//             background color gradient
            LinearGradient(
                colors: [
                    .orangeA,
                    .pinkA],
                startPoint: startAnimation ? .topLeading : .bottomLeading,
                endPoint: startAnimation ? .bottomTrailing : .topTrailing
            ).onAppear {
                withAnimation(.linear(duration: 10.0).repeatForever()) {
                    startAnimation.toggle()
                }
            }
                   .ignoresSafeArea(.all)
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("Join Us")
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 1)

                
                
                
                SignUpTextFieldsBoxView(backgroundOpacity: 1, screen: $screen)
                    .cornerRadius(20)
                    .padding(20)
//                    .shadow(color: Color.white, radius: 5)
                
                // progress bar
                ProgressStepsView(step: 1, white: true)
                    .foregroundColor(Color.orangeA)
            }
        }
    }
}

struct SignUpTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldsView(screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

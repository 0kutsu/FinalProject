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
                   .opacity(1)
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("Join Us")
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 1)

                
                
                
                SignUpTextFieldsBoxView(backgroundOpacity: 1, screen: $screen)
                    .cornerRadius(30)
                    .padding()
                
                
                // progress bar
                    .safeAreaInset(edge: .bottom) {
                        ProgressStepsView(step: 1, white: true)
                            .foregroundColor(Color.orangeMain)
                            .frame(height: 80)
                    }

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

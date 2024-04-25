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
            // background color gradient
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
                Text("Join Us!")
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 100)
                    .padding(.top, 80)
                    
                
                SignUpTextFieldsBoxView(screen: $screen)
                    .cornerRadius(30)
                
                
                // progress bar
                progressStepsView(step: 1)
                    
                }
            
                
                    
            
                Spacer()
            }
        
//            .background(Color.orangeMain)
        .edgesIgnoringSafeArea(.all)
        }
    }

struct SignUpTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldsView(screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

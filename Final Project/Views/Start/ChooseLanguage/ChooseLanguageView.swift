//
//  ChooseLanguageView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/20/24.
//

import SwiftUI

struct ChooseLanguageView: View {
    // there must be a better way to do this
    @Binding var screen: Screen
    @EnvironmentObject var user: User
    @State private var startAnimation: Bool = false
    public var x:CGFloat = 150
    public var y:CGFloat = 100
    var body: some View {
        
        
        ZStack {
//                         background color gradient
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
            .opacity(0.7)
            
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 50)
                    HStack {
                        Image(systemName: "arrow.right.square.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 5)
                        Text("Select Language")
                            .font(Font(UIFont(name: "HelveticaNeue-Thin", size: 30) ?? UIFont.systemFont(ofSize: 50)))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)

                            .multilineTextAlignment(.center)
                            .padding(.bottom, 1)
                        
                        .frame(height: 60)
                    }
                    
                    ChooseLanguageBoxView(buttonOpacity: 1, backgroundOpacity: 0.6, screen: $screen)
                        .cornerRadius(30)
                        .padding(.horizontal)
                    
                    // progress bar
                        .safeAreaInset(edge: .bottom) {
                            ProgressStepsView(step: 2, white: true)
                                .foregroundColor(Color.orangeMain)
                                .frame(height: 80)
                        }
                }
            }
        }
        
    }
}

struct ChooseLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguageView(screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

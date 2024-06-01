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
            GradientBackground(color1: Color.orangeA, color2: Color.pinkA, opacity: 1)
            ZStack {
                VStack {
                    Spacer()

                    HStack {
                        Image(systemName: "arrow.right.square.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 5)
                        Text("Select Language")
                            .font(textFont(name: "helvetica-bold", size: 30))
                            .foregroundColor(Color.white)
                    }

                    ChooseLanguageBoxView(screen: $screen)
                        .cornerRadius(20)
//                        .shadow(color: Color.white, radius: 5)
                        .padding(20)
                    
                    // progress bar
                        .safeAreaInset(edge: .bottom) {
                            ProgressStepsView(step: 2, white: true)
                                .foregroundColor(Color.orangeMain)
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

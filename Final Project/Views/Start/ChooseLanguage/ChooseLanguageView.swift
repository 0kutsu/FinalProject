//
//  ChooseLanguageView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/20/24.
//

import SwiftUI

struct ChooseLanguageView: View {
    // there must be a better way to do this
    
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
                Text("Choose")
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 130)
                Text("Language")
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 70)
                    
                
                ChooseLanguageBoxView()
                    .cornerRadius(30)
                Spacer()
                // progress bar
                progressStepsView(step: 2)
                .padding()
                    

                }
                
            }
        }
    }

struct ChooseLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguageView()
    }
}

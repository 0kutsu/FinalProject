//
//  GradientBackground.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/2/24.
//

import SwiftUI

struct GradientBackground: View {
    public var color1: Color
    public var color2: Color
    public var opacity: Double
    @State private var startAnimation: Bool = false
    public var x:CGFloat = 150
    public var y:CGFloat = 100
    var body: some View {
        LinearGradient(
            colors: [
                color1,
                color2],
            startPoint: startAnimation ? .topLeading : .bottomLeading,
            endPoint: startAnimation ? .bottomTrailing : .topTrailing
        ).onAppear {
            withAnimation(.linear(duration: 10).repeatForever()) {
                startAnimation.toggle()
            }
        }
        .ignoresSafeArea(.all)
        .opacity(opacity)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground(color1: Color.orange, color2: Color.orangeMain, opacity: 0.7)
    }
}

//
//  MessagingToolBar.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/1/24.
//

import SwiftUI

struct ChatToolBarView: View {
    var body: some View {
        ZStack {
            GradientBackground(color1: Color.orangeA, color2: Color.blueA, opacity: 1)
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("Finish")
                        .font(textFont(name: "helvetica", size: 20))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                    
                }
            }
        }
    }
}

struct ChatToolBar_Previews: PreviewProvider {
    static var previews: some View {
        ChatToolBarView()
    }
}

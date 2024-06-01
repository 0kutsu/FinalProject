//
//  SelectLevelButtonView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/31/24.
//

import SwiftUI

struct SelectLevelButtonView: View {
    @Binding var selectedLevel: String
    let level: String
    let image: Image
    var body: some View {
        VStack {
            Button {
                if(selectedLevel == level) {
                    selectedLevel = "none"
                }
                else {
                    selectedLevel = level
                }
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 70)
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        .padding(5)
                        .background(selectedLevel == level ? Color.orangeA : Color.clear)
                        .cornerRadius(25)
                        .shadow(radius: 2, y: 1)
                    
                    HStack {
                        image
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 10)
                            .foregroundColor(selectedLevel == level ? Color.orangeA : Color.grayA)
                        Text(level)
                            .font(textFont(name: "helvetica-bold", size: 30))
                            .foregroundColor(selectedLevel == level ? Color.orangeA : Color.grayA)
                        Spacer()
                    }
                    .padding(20)
                }
            }
        }
    }
}

struct SelectLevelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelButtonView(selectedLevel: Binding.constant("New"), level: "New", image: Image(systemName: "arrow.right.square.fill"))
    }
}

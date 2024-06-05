//
//  CardInfoView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/3/24.
//

import SwiftUI

struct CardInfoView: View {
    var card: Card
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    card.imageAnswer 
                        .resizable()
                        .frame(width: 200, height: 200)
                    .clipShape(TopRoundedRectangle(cornerRadius: 20))
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 80)
                        .foregroundColor(Color.white)
                        .clipShape(BottomRoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 2, y: 1)
                    
                    VStack {
                        Text(card.prompt)
                            .font(textFont(name: "helvetica", size: 20))
                            .foregroundColor(Color.blackA)
                            .padding(10)
                    }
                    
                }
            }
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(card: Card.example)
    }
}

//
//  StudyPreviewCardView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/15/24.
//

import SwiftUI
import UIKit

struct TopRoundedRectangle: Shape {
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct BottomRoundedRectangle: Shape {
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct StudyPreviewCardView: View {
    @State var cardImage: Image
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                cardImage
                    .resizable()
                    .frame(width: 200, height: 150)
                    .clipShape(TopRoundedRectangle(cornerRadius: 20))
                
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 120)
                        .foregroundColor(Color.offWhiteA)
                        .clipShape(BottomRoundedRectangle(cornerRadius: 20))
                    
                        Text("Queso")
                            .offset(x: 0, y: -25)
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .foregroundColor(Color.blackA)
                }
            }
            .background(Color.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            

           
            Button {
                
            } label: {
                ZStack {
                    Text("Hard Words")
                        .bold()
                        .font(.system(size: 15))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .foregroundColor(Color.orangeA)
                        .background(Color.offWhiteA.opacity(1))
                        .cornerRadius(30)
                    
                }
                .padding(3)
                .background(Color.orangeA)
                .cornerRadius(30)
                
            }
            .offset(y: 100)
        }
    }
}

struct StudyPreviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
    }
}

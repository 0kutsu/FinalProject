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
//                    Image(systemName: "star.fill")
//
                    
                    VStack {
                        Text("Queso")
                            .offset(x: 0, y: -5)
                            .font(.system(size: 30))
                            .fontWeight(.medium)
                            .foregroundColor(Color.blackA)
                        
                        Text("Hard Words")
                            .bold()
                            .font(.system(size: 15))
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.orangeA.opacity(0.9))
                    }
                    .offset(y: 30)
                        
                    Spacer()
                        .frame(width: 200, height: 100)
                }
                
            }
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.blackA.opacity(0.2), radius: 5, x: 0, y: 10)
            
                
        }
        
    }
        
}

struct StudyPreviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        StudyPreviewCardView(cardImage: Image("CheesePlaceholderImage"))
    }
}

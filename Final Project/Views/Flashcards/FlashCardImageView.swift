//
//  FlashCardImageView.swift
//  Final Project
//
//  Created by Joy Rao (student LM) on 5/30/24.
//

import SwiftUI

struct FlashCardImageView: View {
    @Binding var imageURL: String
    
    var body: some View {
        VStack {
            if let url = URL(string: imageURL) {
                AsyncImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200) // Set image size
                    .cornerRadius(10)
                    .clipped() // Clip the image to the frame
                    .overlay(
                        Rectangle() // Overlay a square shape
                            .foregroundColor(Color.clear) // Make the square shape transparent
                            .frame(width: 200, height: 200) // Set square size
                            .border(Color.orange, width: 2) // Add a border for better visibility
                    )
            }
        }
        //.animation(.easeInOut(duration: 0.3)) // Fade-in animation
    }
}


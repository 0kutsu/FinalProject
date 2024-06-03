//
//  PopupCardView.swift
//  Final Project
//
//  Created by Joy Rao (student LM) on 5/7/24.
//

import SwiftUI

struct PopupCardView: View {
    @Binding var images: [SerpApiImage]
    @Binding var isPresented: Bool

    
    var body: some View {
        VStack {
            if let randomImage = images.randomElement(), let url = URL(string: randomImage.original) {
                AsyncImageView(url: url)
                    .scaledToFill() // Ensure the image scales to fill the frame
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire frame
                    .clipped() // Clip the image to the frame bounds
                    .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the entire screen
            }
        }
        .background(Color.white.opacity(isPresented ? 0.8 : 0)) // Fade-in background
        //.animation(.easeInOut(duration: 0.3)) // Fade-in animation
    }
}

struct FavoriteButton: View {
    @State private var isFavorited: Bool = false
    @Binding var showingAddCardToSetView: Bool
    
    var body: some View {
        Button(action: {
            isFavorited.toggle()
            showingAddCardToSetView = true
        }) {
            Image(systemName: isFavorited ? "star.fill" : "star")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorited ? .yellow : .gray)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/* import SwiftUI

struct PopupCardView: View {
    @Binding var images: [SerpApiImage]
    @Binding var isPresented: Bool
    
    let imageSize: CGFloat = 130 // Adjust this value according to your image size
    
    var body: some View {
        VStack {
            Color.white.opacity(isPresented ? 0.8 : 0) // Change color here
                .frame(maxWidth: imageSize+200, maxHeight: imageSize + 120)
                .animation(.easeInOut(duration: 0.3)) // Fade-in animation
            
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(images.filter { $0.original.starts(with: "https://") }, id: \.original) { image in
                            if let url = URL(string: image.original) {
                                AsyncImageView(url: url)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: imageSize, height: imageSize) // Set image size
                                    .cornerRadius(10)
                                    .clipped() // Clip the image to the frame
                                    .overlay(
                                        Rectangle() // Overlay a square shape
                                            .foregroundColor(Color.clear) // Make the square shape transparent
                                            .frame(width: imageSize, height: imageSize) // Set square size
                                            .border(Color.orange, width: 2) // Add a border for better visibility
                                    )
                            }
                        }
                    }
                    .padding(.all, 5)
                }
                .frame(height: imageSize) // Set height of the ScrollView


        }
    }
}
*/

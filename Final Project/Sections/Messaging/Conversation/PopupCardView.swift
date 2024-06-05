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
    @Binding var imageAnswer: Image

    
    var body: some View {
        VStack {
            if let randomImage = images.randomElement(), let url = URL(string: randomImage.original) {
                AsyncImage(url: url) { phase in
                    if let phaseImage = phase.image {
                        phaseImage
                            .scaledToFill() // Ensure the image scales to fill the frame
                            .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire frame
                            .clipped() // Clip the image to the frame bounds
                            .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the entire screen
                            .onAppear {
                                imageAnswer = phaseImage
                                print("assigned image")
                            }
                    }  else {
                        ProgressView()
                            .frame(width: 200, height: 200)
                            .clipShape(TopRoundedRectangle(cornerRadius: 20))
                    }
                }
            }
        }
        .background(Color.white.opacity(isPresented ? 0.8 : 0)) // Fade-in background
//        .animation(.easeInOut(duration: 0.3)) // Fade-in animation
    }
}

struct FavoriteButton: View {
    @Binding var showingAddCardToSetView: Bool
    
    var body: some View {
        Button(action: {
            showingAddCardToSetView = true
        }) {
            Image(systemName: "folder.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.white)
                .background(Color.orangeA)
                .cornerRadius(20)
                .shadow(radius: 2, y: 1)
        }
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

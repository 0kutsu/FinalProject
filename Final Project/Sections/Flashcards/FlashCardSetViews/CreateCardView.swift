//
//  CreateCardView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/4/24.
//

import SwiftUI

struct CreateCardView: View {
    @Binding var prompt: String
    @Binding var image: Image
    var action: () -> Void
    
    @EnvironmentObject var serpApiService: SerpApiService
    
    @State var isPresented = true
    
    var body: some View {
        VStack(spacing: 0) {
            
            if let randomImage = serpApiService.images.randomElement(), let url = URL(string: randomImage.original) {
                AsyncImage(url: url) { phase in
                    if let phaseImage = phase.image {
                        phaseImage
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(TopRoundedRectangle(cornerRadius: 20))
                            .onAppear {
                                image = phaseImage
                            }
                    }  else {
                        ProgressView()
                            .frame(width: 200, height: 200)
                            .clipShape(TopRoundedRectangle(cornerRadius: 20))
                    }
                }
//                AsyncImageView(url: url)
//                    .scaledToFill() // Ensure the image scales to fill the frame
//                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire frame
//                    .clipped() // Clip the image to the frame bounds
//                    .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the entire screen
            }
            else {
                Image("defaultImage")
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
                
                
                HStack {
                    UnderLineTextFieldView(text: $prompt, textDescription: "Card prompt", secureField: false, size: 20, defaultLineColor: Color.lightGrayA, activeLineColor: Color.orangeA, lineThickness: 2)
                        .frame(width: 160)
                        .onSubmit {
                            let query = translateSpanishToEnglish(prompt)
                            serpApiService.fetchImages(query: query)
                            print("searched")
                        }
                    
                        
                }
                
                HStack {
                    Button {
                            action()
                        } label: {
                            Text("Add card")
                                .font(textFont(name: "helvetica", size: 20))
                                .padding(.vertical, 10)
                                .frame(width: 200)
                                .foregroundColor(Color.orangeA)
                                .background(Color.white)
                                .cornerRadius(30)
                        }
                        .shadow(radius: 2, y: 1)
                    .offset(y: 80)
                    }
                }
                
                
            }
    }
}

struct CreateCardView_Preview: PreviewProvider {
    static var previews: some View {
        CreateCardView(prompt: Binding.constant(""), image: Binding.constant(Image("defaultImage")), action: {
            print("sdf")
        })
        .environmentObject(SerpApiService())
    }
}

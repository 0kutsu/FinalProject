//
//  MessageView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import SwiftUI

enum showView {
    case image, text
}

// Function to calculate the width of the message
func calculateMessageWidth(message: String) -> CGFloat {
    let words = message.components(separatedBy: " ")
    let totalWordWidth = words.reduce(0) { $0 + getTextWidth(text: $1) }
    // Add padding and any other necessary adjustments
    let totalWidth = totalWordWidth*1.7 + 40 // Assuming padding of 20 on each side
    return min(totalWidth, 290) // Max width 290 as defined in the frame
}

// Function to calculate the width of a text
func getTextWidth(text: String) -> CGFloat {
    let font = UIFont.systemFont(ofSize: UIFont.systemFontSize) // Assuming system font
    let attributes = [NSAttributedString.Key.font: font]
    let size = (text as NSString).size(withAttributes: attributes)
    return size.width
}

struct MessageView: View {
    var message: Message
    var isFromCurrentUser: Bool = false
    @State var buttonStates: [[Int]] = []
    @StateObject var serpApiService = SerpApiService()
    @State private var isPopupVisible = false
    private let pages: [showView] = [.image, .text]
    
    @Binding var showingAddCardToSetView: Bool
    
    
    init(message: Message, showingAddCardToSetView: Binding<Bool>) {
        self.message = message
        let words = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)
        self._buttonStates = State(initialValue: words.map { Array(repeating: -1, count: $0.count) })
        self._showingAddCardToSetView = showingAddCardToSetView
    }
    
    var body: some View {
        // if the message is from the current user
        if message.isFromCurrentUser() {
            HStack{
                HStack {
                    VStack {
                        /*Buttons text and stuff*/
                        HStack {
                            Spacer()
                            VStack {
                                ForEach(buttonStates.indices, id: \.self) { lineIndex in
                                    let lineWords = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)[lineIndex]
                                    HStack {
                                        ForEach(lineWords.indices, id: \.self) { wordIndex in
                                            let word = lineWords[wordIndex]
                                            Button(action: {
                                                buttonStates[lineIndex][wordIndex] *= -1
                                                print("\(lineIndex) \(wordIndex)")
                                                
                                            }) {
                                                Text(String(word))
                                                    .foregroundColor(Color.white)
                                                    .lineLimit(1)
                                                    .padding(.trailing, isPunctuation(word) ? -7 : 0)
                                                    .padding(.leading, isPunctuation(word) ? -5 : 0)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: calculateMessageWidth(message: message.text), alignment: .topLeading) // Adjusted frame width
                            .background(Color.blueA)
                            .cornerRadius(20)
                            .padding(1)
                        }
                        
                        HStack {
                            ForEach(buttonStates.indices, id: \.self) { lineIndex in
                                ForEach(buttonStates[lineIndex].indices, id: \.self) { wordIndex in
                                    if buttonStates[lineIndex][wordIndex] != -1 {
                                        let clickedWord = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)[lineIndex][wordIndex]
                                        let translatedWord = translateSpanishToEnglish(clickedWord)
                                        var searchQuery = "\(translatedWord)"
                                        
                                        Button(action: {
                                            buttonStates[lineIndex][wordIndex] *= -1
                                            serpApiService.fetchImages(query: searchQuery)
                                        }) {
                                            Image(systemName: "xmark.circle")
                                                .foregroundColor(.black)
                                        }
                                        
                                        if(translatedWord.elementsEqual("you have not learned yet")){
                                            Text("You clicked on \(clickedWord), which isn't in your dictionary")
                                        }
                                        else{
                                            TabView {
                                                ForEach(pages, id: \.self) { page in
                                                    if page == .image {
                                                        PopupCardView(images: $serpApiService.images, isPresented: $isPopupVisible)
                                                    }
                                                    else {
                                                        ZStack{
                                                            VStack {
                                                                
                                                                Text("Definition")
                                                                    .font(.title)
                                                                    .foregroundColor(.orange)
                                                                    .padding(.top, 15)
                                                                Text("You clicked on \(clickedWord), which means ''\(translatedWord)''")
                                                                    .padding([.bottom, .leading, .trailing], 10)
                                                            }
                                                            
                                                            FavoriteButton(showingAddCardToSetView: $showingAddCardToSetView)
                                                                .offset(x: 109)
                                                                .padding(.top, -85)
                                                        }
                                                    }
                                                }
                                            }
                                            .frame(height: 200)
                                            .background(Color.white)
                                            .cornerRadius(20)
                                            .padding(.all, 5)
                                            .shadow(radius: 5)
                                            .tabViewStyle(.page)
                                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
//                Image("default pfp")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(maxWidth: 30, maxHeight: 30, alignment: .top)
//                    .cornerRadius(15)
//                    .padding(.leading, 5)
            }
            .frame(maxWidth: 360, alignment: .trailing)
        }
        
        // if message is not from current user
        else {
            HStack{
                // profile image
                //                Image("default pfp")
                //                    .resizable()
                //                    .scaledToFill()
                //                    .frame(maxWidth: 30, maxHeight: 30, alignment: .top)
                //                    .cornerRadius(15)
                //                    .padding(.leading, 5)
                
                VStack {
                    /*Buttons text and stuff*/
                    HStack {
                        VStack {
                            ForEach(buttonStates.indices, id: \.self) { lineIndex in
                                let lineWords = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)[lineIndex]
                                HStack {
                                    ForEach(lineWords.indices, id: \.self) { wordIndex in
                                        let word = lineWords[wordIndex]
                                        Button(action: {
                                            buttonStates[lineIndex][wordIndex] *= -1
                                            print("\(lineIndex) \(wordIndex)")
                                            
                                        }) {
                                            Text(String(word))
                                                .foregroundColor(Color.blackA)
                                                .lineLimit(1)
                                                .padding(.trailing, isPunctuation(word) ? -7 : 0)
                                                .padding(.leading, isPunctuation(word) ? -5 : 0)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: calculateMessageWidth(message: message.text), alignment: .leading) // Adjusted frame width
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(20)
                        .padding(1)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ForEach(buttonStates.indices, id: \.self) { lineIndex in
                            ForEach(buttonStates[lineIndex].indices, id: \.self) { wordIndex in
                                if buttonStates[lineIndex][wordIndex] != -1 {
                                    let clickedWord = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)[lineIndex][wordIndex]
                                    let translatedWord = translateSpanishToEnglish(clickedWord)
                                    let searchQuery = "\(translatedWord)"
                                    
                                    Button(action: {
                                        buttonStates[lineIndex][wordIndex] *= -1
                                        serpApiService.fetchImages(query: searchQuery)
                                    }) {
                                        Image(systemName: "xmark.circle")
                                            .foregroundColor(.black)
                                    }
                                    
                                    // if the word isn't in the dictionary
                                    if(translatedWord.elementsEqual("you have not learned yet")) {
                                        Text("You clicked on \(clickedWord), which isn't in your dictionary")
                                    }
                                    
                                    // show the word
                                    else{
                                        TabView {
                                            ForEach(pages, id: \.self) { page in
                                                // if it is the image page
                                                if page == .image {
                                                    PopupCardView(images: $serpApiService.images, isPresented: $isPopupVisible)
                                                        .frame(height: 200)
                                                }
                                                // if it is the definition page
                                                else {
                                                    ZStack {
                                                        VStack {
                                                            
                                                            Text("Definition")
                                                                .font(.title)
                                                                .foregroundColor(.orangeA)
                                                                .padding(.top, 15)
                                                            Text("You clicked on \(clickedWord), which means ''\(translatedWord)''")
                                                                .padding([.bottom, .leading, .trailing], 10)
                                                        }
                                                        
                                                        // favorite button in definition page
                                                        FavoriteButton(showingAddCardToSetView: $showingAddCardToSetView)
                                                            .offset(x: 109)
                                                            .padding(.top, -85)
                                                    }
                                                }
                                            }
                                        }
                                        .frame(height: 200)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .padding(.all, 5)
                                        .shadow(radius: 5)
                                        .tabViewStyle(.page)
                                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                
            }
            .frame(maxWidth: 360, alignment: .leading)
        }
        
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(userUid: "123", text: "hewo como estas asdf asdf uwu hola hola hola hola", createdAt: Date()), showingAddCardToSetView: Binding.constant(false))
    }
}





struct AsyncImageView: View {
    let url: URL
    @State private var imageData: Data?
    
    var body: some View {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
        } else if imageData == nil {
            ProgressView()
                .onAppear {
                    fetchData()
                }
        } else {
            EmptyView() // Hide the view if the image failed to load
        }
    }
    
    private func fetchData() {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Failed to load image:", error?.localizedDescription ?? "Unknown error")
                return
            }
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}


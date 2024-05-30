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

struct MessageView: View {
    var message: Message
    var isFromCurrentUser: Bool = false
    @State var buttonStates: [[Int]] = []
    @StateObject var serpApiService = SerpApiService()
    @State private var isPopupVisible = false
    private let pages: [showView] = [.image, .text]
    
    init(message: Message) {
        self.message = message
        let words = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)
        self._buttonStates = State(initialValue: words.map { Array(repeating: -1, count: $0.count) })
        
    }
    var body: some View {
        if message.isFromCurrentUser() {
            HStack{
                HStack {
                    VStack {
                        /*Buttons text and stuff*/ VStack {
                            ForEach(buttonStates.indices, id: \.self) { lineIndex in
                                let lineWords = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)[lineIndex]
                                HStack {
                                    ForEach(lineWords.indices, id: \.self) { wordIndex in
                                        let word = lineWords[wordIndex]
                                        Button(action: {
                                            let translatedWord = translateSpanishToEnglish(word)
                                            buttonStates[lineIndex][wordIndex] *= -1
                                            print("\(lineIndex) \(wordIndex)")
                                            
                                        }) {
                                            let translatedWord = translateSpanishToEnglish(word)
                                            
                                            Text(String(word))
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                .padding(.trailing, isPunctuation(word) ? -7 : 0)
                                                .padding(.leading, isPunctuation(word) ? -5 : 0)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            
                        }.padding()
                            .frame(maxWidth: 260, alignment: .topLeading)
                            .background(Color(uiColor: .systemBlue))
                            .cornerRadius(20)
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
                                                            
                                                            FavoriteButton()
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
                Image("default pfp")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 32, maxHeight: 32, alignment: .top)
                    .cornerRadius(16)
                    .padding(.bottom, 24)
                    .padding(.leading, 4)
            }
            .frame(maxWidth: 360, alignment: .trailing)
        } else {
            HStack{
                Image("default pfp")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 32, maxHeight: 32, alignment: .top)
                    .cornerRadius(16)
                    .padding(.bottom, 24)
                    .padding(.leading, 4)
                HStack {
                    VStack {
                        /*Buttons text and stuff*/ VStack {
                            ForEach(buttonStates.indices, id: \.self) { lineIndex in
                                let lineWords = splitStringByDictionaryKeys(message.text, dictionary: spanishToEnglish)[lineIndex]
                                HStack {
                                    ForEach(lineWords.indices, id: \.self) { wordIndex in
                                        let word = lineWords[wordIndex]
                                        Button(action: {
                                            let translatedWord = translateSpanishToEnglish(word)
                                            buttonStates[lineIndex][wordIndex] *= -1
                                            print("\(lineIndex) \(wordIndex)")
                                            
                                        }) {
                                            let translatedWord = translateSpanishToEnglish(word)
                                            
                                            Text(String(word))
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                .padding(.trailing, isPunctuation(word) ? -7 : 0)
                                                .padding(.leading, isPunctuation(word) ? -5 : 0)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            
                        }.padding()
                            .frame(maxWidth: 260, alignment: .leading)
                            .background(Color(uiColor: .lightGray))
                            .cornerRadius(20) .padding(.all,10)
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
                                                            .frame(height: 200)
                                                    }
                                                    else {
                                                        ZStack {
                                                            VStack {
                                                                
                                                                Text("Definition")
                                                                    .font(.title)
                                                                    .foregroundColor(.orange)
                                                                    .padding(.top, 15)
                                                                Text("You clicked on \(clickedWord), which means ''\(translatedWord)''")
                                                                    .padding([.bottom, .leading, .trailing], 10)
                                                            }
                                                            
                                                            FavoriteButton()
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
                
            }
            .frame(maxWidth: 360, alignment: .leading)
        }
        
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(userUid: "123", text: "hewo donde esta uwu hola hola hola hola mano", createdAt: Date()))
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


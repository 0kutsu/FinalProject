//
//  MessageView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    var isFromCurrentUser: Bool = false
    @State var buttonStates: [[Int]] = []
    
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
                                            print("You clicked on \(word), which means \(translatedWord)")
                                            buttonStates[lineIndex][wordIndex] *= -1
                                            print("\(lineIndex) \(wordIndex)")
                                        }) {
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
                                        
                                        Button(action: {
                                            buttonStates[lineIndex][wordIndex] *= -1
                                        }) {
                                            Image(systemName: "xmark.circle")
                                                .foregroundColor(.black)
                                        }
                                        
                                        if(translatedWord.elementsEqual("you have not learned yet")){
                                            Text("You clicked on \(clickedWord), which isn't in your dictionary")
                                        }
                                        else{
                                            Text("You clicked on \(clickedWord), which means ''\(translatedWord)''")
                                                .foregroundColor(.black)
                                                .padding(.all, 10)
                                                .background(Color.orange)
                                                .cornerRadius(20)
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
                                            print("You clicked on \(word), which means \(translatedWord)")
                                            buttonStates[lineIndex][wordIndex] *= -1
                                            print("\(lineIndex) \(wordIndex)")
                                        }) {
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
                                        
                                        Button(action: {
                                            buttonStates[lineIndex][wordIndex] *= -1
                                        }) {
                                            Image(systemName: "xmark.circle")
                                                .foregroundColor(.black)
                                        }
                                        
                                        if(translatedWord.elementsEqual("you have not learned yet")){
                                            Text("You clicked on \(clickedWord), which isn't in your dictionary")
                                        }
                                        else{
                                            Text("You clicked on \(clickedWord), which means ''\(translatedWord)''")
                                                .foregroundColor(.black)
                                                .padding(.all, 10)
                                                .background(Color.orange)
                                                .cornerRadius(20)
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
        MessageView(message: Message(userUid: "123", text: "hewo como estas uwu hola hola hola hola", createdAt: Date()))
    }
}

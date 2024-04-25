//
//  ChooseLanguageBoxView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/22/24.
//

import SwiftUI

struct ChooseLanguageBoxView: View {
    let languages1: [Language] = [Language(name: "German", nativeName: "Deutsch"), Language(name: "Greek", nativeName: "Ελληνικά"), Language(name: "Italian", nativeName: "Italiano")]
    let languages2: [Language] = [Language(name: "Japanese", nativeName: "日本語"), Language(name: "Russian", nativeName: "Pусский"), Language(name: "Spanish", nativeName: "Español")]
    var body: some View {
        
        VStack {
                HStack {
                    VStack {
                        ForEach(languages1) { language in
                            Button {
                                
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 150, height: 135)
                                        .cornerRadius(25)
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(Color.orange)
                                        .cornerRadius(30)
                                    VStack {
                                        language.flag
                                            .resizable()
                                            .frame(width: 70, height: 50)
                                            .cornerRadius(10)
                                        
                                        Text(language.name)
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.orangeMain)
                                        Text(language.nativeName)
                                            .foregroundColor(Color.orangeMain)

                                    }
                                }
                            }
                            
                            
                            
                        }
                    }
                    VStack {
                        ForEach(languages2) { language in
                            Button {
                                
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 150, height: 135)
                                        .cornerRadius(25)
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(Color.orange)
                                        .cornerRadius(30)
                                    VStack {
                                        language.flag
                                            .resizable()
                                            .frame(width: 70, height: 50)
                                            .cornerRadius(10)
                                        
                                        Text(language.name)
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.orangeMain)
                                        Text(language.nativeName)
                                            .foregroundColor(Color.orangeMain)

                                    }
                                }
                            }
                        }
                }
            }
                .padding()
            
                Button {
                    
                } label: {
                    Text("Select")
                        .padding(.vertical, 10)
                        .frame(width: 290)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        
                        .bold()
                        
                }
                .padding(.bottom, 20)
                
        }
        .background(Color.white)

        
    }
    
    struct ChooseLanguageBoxView_Previews: PreviewProvider {
        static var previews: some View {
            ChooseLanguageBoxView()
        }
    }
}

//
//  ChooseLanguageBoxView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/22/24.
//

import SwiftUI

struct ChooseLanguageBoxView: View {
    @State var buttonOpacity: Double
    @State var backgroundOpacity: Double
    @Binding var screen: Screen
    @EnvironmentObject var user: User
    @State var selectedLanguage: String = "none"
    let languages1: [Language] = [Language(name: "German", nativeName: "Deutsch"), Language(name: "Greek", nativeName: "Ελληνικά"), Language(name: "Italian", nativeName: "Italiano")]
    let languages2: [Language] = [Language(name: "Japanese", nativeName: "日本語"), Language(name: "Russian", nativeName: "Pусский"), Language(name: "Spanish", nativeName: "Español")]
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .opacity(backgroundOpacity)
                .cornerRadius(0.3)
            VStack {
                    HStack {
                        VStack {
                            ForEach(languages1) { language in
                                Button {
                                    if(selectedLanguage == language.name) {
                                        selectedLanguage = "none"
                                    }
                                    else {
                                        selectedLanguage = language.name
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 133, height: 133)
                                            .cornerRadius(25)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .background(selectedLanguage == language.name ? Color.orange : Color.clear)
                                            .cornerRadius(30)
                                            .opacity(buttonOpacity)
//                                            .shadow(radius: 2)
                                        
                                        VStack {
                                            language.flag
                                                .resizable()
                                                .frame(width: 70, height: 50)
                                                .cornerRadius(10)
                                            Text(language.name)
                                                .fontWeight(.heavy)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orange : Color.gray)
                                            Text(language.nativeName)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orange : Color.gray)
                                        }
                                    }
                                    
                                }
                            }
                        }
                        .padding(.horizontal, 2.5)
                        
                        VStack {
                            ForEach(languages2) { language in
                                Button {
                                    if(selectedLanguage == language.name) {
                                        selectedLanguage = "none"
                                    }
                                    else {
                                        selectedLanguage = language.name
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 133, height: 133)
                                            .cornerRadius(25)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .background(selectedLanguage == language.name ? Color.orange : Color.clear)
                                            .cornerRadius(30)
                                            .opacity(buttonOpacity)
//                                            .shadow(radius: 2)
                                        
                                        VStack {
                                            language.flag
                                                .resizable()
                                                .frame(width: 70, height: 50)
                                                .cornerRadius(10)
                                            Text(language.name)
                                                .fontWeight(.heavy)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orange : Color.gray)
                                            Text(language.nativeName)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orange : Color.gray)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 2.5)

                    }
                    .padding()
                    
                    Button {
                        screen = .selectLevelView
                        for l in languages1 {
                            if l.name == selectedLanguage {
                                user.language = l
                            }
                        }
                        for l in languages2  {
                            if l.name == selectedLanguage {
                                user.language = l
                            }
                        }
                        print("chose \(user.language.name)")
                    } label: {
                        Text("Select")
                            .padding(.vertical, 10)
                            
                            .frame(width: 290)
                            .background(selectedLanguage == "none" ? Color.orangeFaded50 : Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .bold()
                            .opacity(buttonOpacity)
//                            .shadow(radius: 2)
                    }
                    .disabled(selectedLanguage == "none")
                    .padding(.bottom, 20)
            }
        }

            
            
           
    }
        
    
    struct ChooseLanguageBoxView_Previews: PreviewProvider {
        static var previews: some View {
            ChooseLanguageBoxView(buttonOpacity: 1, backgroundOpacity: 0.3, screen: Binding.constant(.userView))
                    .environmentObject(User())
               
        }
    }
}

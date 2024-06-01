//
//  ChooseLanguageBoxView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/22/24.
//

import SwiftUI

struct ChooseLanguageBoxView: View {
    @Binding var screen: Screen
    @EnvironmentObject var user: User
    @State var selectedLanguage: String = "none"
    let languages1: [Language] = [Language(name: "German", nativeName: "Deutsch"), Language(name: "Greek", nativeName: "Ελληνικά"), Language(name: "Italian", nativeName: "Italiano")]
    let languages2: [Language] = [Language(name: "Japanese", nativeName: "日本語"), Language(name: "Russian", nativeName: "Pусский"), Language(name: "Spanish", nativeName: "Español")]
    var body: some View {
        
        ZStack {
            VStack {
                    HStack {
                        Spacer()
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
                                            .cornerRadius(20)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .background(selectedLanguage == language.name ? Color.orangeA : Color.clear)
                                            .cornerRadius(25)
                                            .shadow(radius: 2, y: 1)
                                        
                                        VStack {
                                            language.flag
                                                .resizable()
                                                .frame(width: 70, height: 50)
                                                .cornerRadius(10)
                                            Text(language.name)
                                                .fontWeight(.heavy)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orangeA : Color.grayA)
                                            Text(language.nativeName)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orangeA : Color.grayA)
                                        }
                                    }
                                    
                                }
                            }
                        }
                        Spacer()
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
                                            .cornerRadius(20)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .background(selectedLanguage == language.name ? Color.orangeA : Color.clear)
                                            .cornerRadius(25)
                                            .shadow(radius: 2, y: 1)
                                        
                                        VStack {
                                            language.flag
                                                .resizable()
                                                .frame(width: 70, height: 50)
                                                .cornerRadius(10)
                                            Text(language.name)
                                                .fontWeight(.heavy)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orangeA : Color.grayA)
                                            Text(language.nativeName)
                                                .foregroundColor(selectedLanguage == language.name ? Color.orangeA : Color.grayA)
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical, 20)
                    
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
                            .background(selectedLanguage == "none" ? Color.orangeA.opacity(0.5) : Color.orangeA)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .bold()
                            .shadow(radius: 2, y: 1)

                    }
                    .disabled(selectedLanguage == "none")
                    .padding(.bottom, 40)
            }
//            .background(Color.orangeA)
            .background(Color.white)

        }

            
            
           
    }
        
    
    struct ChooseLanguageBoxView_Previews: PreviewProvider {
        static var previews: some View {
            ChooseLanguageBoxView(screen: Binding.constant(.userView))
                    .environmentObject(User())
               
        }
    }
}

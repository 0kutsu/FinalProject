//
//  SelectLevelView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/30/24.
//

import SwiftUI

struct SelectLevelView: View {
    @EnvironmentObject var user: User
    
    @State var buttonOpacity: Double = 1
    @State var backgroundOpacity: Double = 0.7
    @Binding var screen: Screen
    @State private var startAnimation: Bool = false
    @State var selectedLevel: String = "none"
    public var x:CGFloat = 150
    public var y:CGFloat = 100
    var body: some View {
        ZStack {
            //             background color gradient
            GradientBackground(color1: Color.orangeA, color2: Color.pinkA, opacity: 1)
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "arrow.right.square.fill")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 5)
                    Text("Select Level")
                        .font(textFont(name: "helvetica-bold", size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 20)
                
                VStack {
                    VStack {
                        VStack {

                            SelectLevelButtonView(selectedLevel: $selectedLevel, level: "New", image: Image(systemName: "arrow.right.square.fill"))
                            // shadow is done in the button level
                            
                            Spacer()
                            
                            SelectLevelButtonView(selectedLevel: $selectedLevel, level: "Familiar", image: Image(systemName: "arrow.right.square.fill"))
                            
                            
                            Spacer()
                            
                            SelectLevelButtonView(selectedLevel: $selectedLevel, level: "Experienced", image: Image(systemName: "arrow.right.square.fill"))
                            
                            Spacer()
                            
                            
                            SelectLevelButtonView(selectedLevel: $selectedLevel, level: "Advanced", image: Image(systemName: "arrow.right.square.fill"))
                            
                            
                            Spacer()
                            
                            Button {
                                user.signUp()
                                screen = .homeView
                            } label: {
                                Text("Complete")
                                    .font(textFont(name: "helvetica", size: 20))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 100)
                                    .background(selectedLevel == "none" ? Color.orangeA.opacity(0.5) : Color.orangeA)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 2, y: 1)
                            }
                            .disabled(selectedLevel == "none")
                            
          
                        }
                        .padding(20)
                        .padding(.vertical, 20)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(20)
                        
                    }
                }
            }
        
        .safeAreaInset(edge: .bottom) {
            ProgressStepsView(step: 3, white: true)
        }
    }
    
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView(screen: Binding.constant(.userView))
            .environmentObject(User())
    }
}

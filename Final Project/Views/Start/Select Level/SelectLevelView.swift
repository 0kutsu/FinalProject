//
//  SelectLevelView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/30/24.
//

import SwiftUI

struct SelectLevelView: View {
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
            LinearGradient(
                colors: [
                    .orangeMain,
                    .orange],
                startPoint: startAnimation ? .topLeading : .bottomLeading,
                endPoint: startAnimation ? .bottomTrailing : .topTrailing
            ).onAppear {
                withAnimation(.linear(duration: 5.0).repeatForever()) {
                    startAnimation.toggle()
                }
            }
            .ignoresSafeArea(.all)
            .opacity(0.7)
            
                VStack {
                    Spacer()
                        .frame(height: 75)
                    HStack {
                        Image(systemName: "arrow.right.square.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 5)
                        Text("Select Level")
                            .font(Font(UIFont(name: "HelveticaNeue-Thin", size: 30) ?? UIFont.systemFont(ofSize: 50)))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 1)
                        
                        .frame(height: 60)
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .opacity(backgroundOpacity)
                            .cornerRadius(30)
                            .padding()
                        
                        VStack {
                            Button {
                                if(selectedLevel == "New") {
                                    selectedLevel = "none"
                                }
                                else {
                                    selectedLevel = "New"
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 290, height: 70)
                                        .cornerRadius(25)
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(selectedLevel == "New" ? Color.orange : Color.clear)
                                        .cornerRadius(30)
                                         
                                    HStack {
                                        Image(systemName: "arrow.right.square.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 50)
                                            .foregroundColor(selectedLevel == "New" ? Color.orange : Color.gray)
                                        Text("New")
                                            .font(Font(UIFont(name: "HelveticaNeue-Thin", size: 30) ?? UIFont.systemFont(ofSize: 50)))
                                            .fontWeight(.medium)
                                            .foregroundColor(selectedLevel == "New" ? Color.orange : Color.gray)
                                            .opacity(0.75)
                                    }
                                    .padding(.trailing, 90)
                                    
                                }
                            }
                            .padding(.top, 30)
                            Button {
                                if(selectedLevel == "Familiar") {
                                    selectedLevel = "none"
                                }
                                else {
                                    selectedLevel = "Familiar"
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 290, height: 70)
                                        .cornerRadius(25)
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(selectedLevel == "Familiar" ? Color.orange : Color.clear)
                                        .cornerRadius(30)
                                         
                                    HStack {
                                        Image(systemName: "arrow.right.square.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 50)
                                            .foregroundColor(selectedLevel == "New" ? Color.orange : Color.gray)
                                        Text("Familiar")
                                            .font(Font(UIFont(name: "HelveticaNeue-Thin", size: 30) ?? UIFont.systemFont(ofSize: 50)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(selectedLevel == "Familiar" ? Color.orange : Color.gray)
                                            .opacity(0.75)
                                    }
                                    .padding(.trailing, 40)
                                }
                            }
                            Button {
                                if(selectedLevel == "Experienced") {
                                    selectedLevel = "none"
                                }
                                else {
                                    selectedLevel = "Experienced"
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 290, height: 70)
                                        .cornerRadius(25)
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(selectedLevel == "Experienced" ? Color.orange : Color.clear)
                                        .cornerRadius(30)
                                         
                                    HStack {
                                        Image(systemName: "arrow.right.square.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 50)
                                            .foregroundColor(selectedLevel == "New" ? Color.orange : Color.gray)
                                        Text("Experienced")
                                            .font(Font(UIFont(name: "HelveticaNeue-Thin", size: 30) ?? UIFont.systemFont(ofSize: 50)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(selectedLevel == "Experienced" ? Color.orange : Color.gray)
                                            .opacity(0.75)
                                    }
                               
                                }
                            }
                            Button {
                                if(selectedLevel == "Advanced") {
                                    selectedLevel = "none"
                                }
                                else {
                                    selectedLevel = "Advanced"
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 290, height: 70)
                                        .cornerRadius(25)
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(selectedLevel == "Advanced" ? Color.orange : Color.clear)
                                        .cornerRadius(30)
                                    HStack {
                                        Image(systemName: "arrow.right.square.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.trailing, 50)
                                            .foregroundColor(selectedLevel == "New" ? Color.orange : Color.gray)
                                        Text("Advanced")
                                            .font(Font(UIFont(name: "HelveticaNeue-Thin", size: 30) ?? UIFont.systemFont(ofSize: 50)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(selectedLevel == "Advanced" ? Color.orange : Color.gray)
                                            .opacity(0.75)
                                    }
                                    .padding(.trailing, 75)
                                }
                            }
                            Button {
                                screen = .homeView
                            } label: {
                                Text("Continue")
                                    .padding(.vertical, 10)
                                    .frame(width: 290)
                                    .background(selectedLevel == "none" ? Color.orangeFaded50 : Color.orange)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                                    .bold()
                                     
                            }
                            .disabled(selectedLevel == "none")
                        }
                        
                        .padding(.bottom, 50)
                        .padding(.top, 10)
                        
                        
                    }
                    
                    
                    
                    
                    
                    Spacer()
                    .safeAreaInset(edge: .bottom) {
                        ProgressStepsView(step: 3, white: true)
                            .foregroundColor(Color.orangeMain)
                            .frame(height: 80)
                        
                        
                    }
                }
        }
    }
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView(screen: Binding.constant(.userView))
    }
}

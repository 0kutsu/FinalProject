//
//  CreateChatView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 4/25/24.
//

import SwiftUI



struct CreateChatView: View {
    
    @State var difficulty: Difficulty = .easy
    @State var chatType: ChatType = .classic
    @Binding var confirmed: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Room Settings")
                .font(textFont(name: "helvetica-bold", size: 30))
                .foregroundColor(confirmed ? Color.orangeA : Color.blackA)
                .padding(20)
            
            HStack {
                Text("Difficulty")
                    .font(textFont(name: "helvetica-bold", size: 20))
                    .foregroundColor(confirmed ? Color.orangeA : Color.blackA)
                Spacer()
            }
            .padding(.vertical, 10)
            
            ZStack{
                Rectangle()
                    .padding(.vertical, 25)
                    .frame(height: 60)
                    .background(confirmed ? Color.white : Color.orangeA.opacity(0.2))
                    .foregroundColor(.clear)
                    .cornerRadius(20)
                
                HStack {
                    Button {
                        difficulty = .easy
                    } label: {
                        HStack {
                            Text("Easy")
                                .font(textFont(name: "helvetica-bold", size: 15))
                                .frame(height: 50)
                                .padding(.horizontal, 20)
                                .foregroundColor( difficulty == .easy ? .white : Color.orangeA)
                                .background( difficulty == .easy ? Color.orangeA : .clear)
                                .cornerRadius(20)
                                .shadow(color: difficulty == .easy ? Color.grayA : Color.clear, radius: 2, y: 1)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        difficulty = .intermediate
                    } label: {
                        Text("Medium")
                            .font(textFont(name: "helvetica-bold", size: 15))
                            .frame(height: 53)
                        // .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .foregroundColor( difficulty == .intermediate ? .white : Color.orangeA)
                            .background( difficulty == .intermediate ? Color.orangeA : .clear)
                            .cornerRadius(20)
                            .shadow(color: difficulty == .intermediate ? Color.grayA : Color.clear, radius: 2, y: 1)
                    }
                    
                    Spacer()
                    
                    Button {
                        difficulty = .advanced
                    } label: {
                        Text("Hard")
                            .font(textFont(name: "helvetica-bold", size: 15))
                            .frame(height: 50)
                            .padding(.horizontal, 20)
                            .foregroundColor( difficulty == .advanced ? .white : Color.orangeA)
                            .background( difficulty == .advanced ? Color.orangeA : .clear)
                            .cornerRadius(20)
                            .shadow(color: difficulty == .advanced ? Color.grayA : Color.clear, radius: 2, y: 1)
                    }
                }
                .padding(.horizontal, 5)
            }
            
            Spacer()
                .frame(height: 20)
            
            HStack {
                Text("Chat Type")
                    .font(textFont(name: "helvetica-bold", size: 20))
                    .foregroundColor(confirmed ? Color.orangeA : Color.blackA)
                Spacer()
            }
            .padding(.vertical, 10)
            
            ZStack{
                Rectangle()
                    .padding(.vertical, 25)
                    .frame(height: 60)
                    .background(confirmed ? Color.white : Color.orangeA.opacity(0.2))
                    .foregroundColor(.clear)
                    .cornerRadius(20)
                
                HStack{
                    Button {
                        chatType = .classic
                    } label: {
                        Text("Classic")
                            .font(textFont(name: "helvetica-bold", size: 15))
                            .frame(height: 50)
                            .padding(.horizontal, 20)
                            .foregroundColor( chatType == .classic ? .white : Color.orangeA)
                            .background(chatType == .classic ? Color.orangeA : .clear)
                            .cornerRadius(20)
                            .shadow(color: chatType == .classic ? Color.grayA : Color.clear, radius: 2, y: 1)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        chatType = .scenario
                    } label: {
                        Text("Scenario")
                            .font(textFont(name: "helvetica-bold", size: 15))
                            .frame(height: 50)
                            .padding(.horizontal, 20)
                            .foregroundColor( chatType == .scenario ? .white : Color.orangeA)
                            .background( chatType == .scenario ? Color.orangeA : .clear)
                            .cornerRadius(20)
                            .shadow(color: chatType == .scenario ? Color.grayA : Color.clear, radius: 2, y: 1)
                    }
                    
                    Spacer()
                    
                    Button {
                        chatType = .timed
                    } label: {
                        Text("Timed")
                            .font(textFont(name: "helvetica-bold", size: 15))
                            .frame(height: 50)
                            .padding(.horizontal, 20)
                            .foregroundColor( chatType == .timed ? .white : Color.orangeA)
                            .background( chatType == .timed ? Color.orangeA : .clear)
                            .cornerRadius(20)
                            .shadow(color: chatType == .timed ? Color.grayA : Color.clear, radius: 2, y: 1)
                    }
                }
                .padding(.horizontal, 5)
            }
            Spacer()
            Button {
                confirmed.toggle()
            } label: {
                Text("Confirm")
                
            }
            
        }
        .padding(.vertical, 20)
    }
}

struct CreateChatView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChatView(confirmed: Binding.constant(false))
    }
}

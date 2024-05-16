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
    
    
//    let ListThree: [DataModel] = [
//        DataModel(iconName: "text.bubble.fill", title: "Broadcast Lists", destination: AnyView(Text("heee"))),
//        DataModel(iconName: "star.fill", title: "Broadcast Lists View", destination: AnyView(Text("Destination 2"))),
//        DataModel(iconName: "link", title: "Starred Messages", destination: AnyView(Text("Destination 3"))),
//        DataModel(iconName: "key.fill", title: "Starred View", destination: AnyView(Text("Destination 4")))
//    ]
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                Text("Difficulty")
                    .padding(.horizontal, 20)
                    .font(.title3)
                    .bold()
                Spacer()
            }
            
            
                ZStack{
                    Rectangle()
                        .padding(.vertical, 25)
                        .background(Color.orangeMain.opacity(0.2))
                        .foregroundColor(.clear)
                        .cornerRadius(20)
                        .padding(.horizontal, 15)
                       
                    HStack{
                        Button {
                            difficulty = .easy
                        } label: {
                            Text("Easy")
                                .frame(height: 53)
                              //  .padding(.vertical, 12)
                                .padding(.horizontal, 20)
                                .foregroundColor( difficulty == .easy ? .white : Color.orangeMain)
                                .bold()
                                .font(.callout)
                                .background( difficulty == .easy ? Color.orangeMain : .clear)
                                .cornerRadius(15)
                                .padding(.leading, -16)
                            
                        }
  
                        Spacer()
                        
                        Button {
                            difficulty = .intermediate
                        } label: {
                            Text("Medium")
                                .frame(height: 53)
                               // .padding(.vertical, 12)
                                .padding(.horizontal, 20)
                                .foregroundColor( difficulty == .intermediate ? .white : Color.orangeMain)
                                .bold()
                                .font(.callout)
                                .background( difficulty == .intermediate ? Color.orangeMain : .clear)
                                .cornerRadius(15)
                        }
                        
                        Spacer()
                        
                        Button {
                            difficulty = .advanced
                        } label: {
                            Text("Hard")
                                .frame(height: 53)
                               // .padding(.vertical, 12)
                                .padding(.horizontal, 20)
                                .foregroundColor( difficulty == .advanced ? .white : Color.orangeMain)
                                .bold()
                                .font(.callout)
                                .background( difficulty == .advanced ? Color.orangeMain : .clear)
                                .cornerRadius(15)
                                .padding(.trailing, -15)
                        }
                    }
                    .padding(.horizontal, 35)
                }
            
            
            
            HStack {
                Text("Chat Type")
                    .padding(.horizontal, 20)
                    .font(.title3)
                    .padding(.top, 30)
                    .bold()
                Spacer()
            }
            
            
            ZStack{
                Rectangle()
                    .padding(.vertical, 25)
                    .background(Color.orangeMain.opacity(0.2))
                    .foregroundColor(.clear)
                    .cornerRadius(20)
                    .padding(.horizontal, 15)
                   
                HStack{
                    Button {
                        chatType = .classic
                    } label: {
                        Text("Classic")
                            .frame(height: 53)
                          //  .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .foregroundColor( chatType == .classic ? .white : Color.orangeMain)
                            .bold()
                            .font(.callout)
                            .background( chatType == .classic ? Color.orangeMain : .clear)
                            .cornerRadius(15)
                            .padding(.leading, -16)
                        
                    }

                    Spacer()
                    
                    Button {
                        chatType = .scenario
                    } label: {
                        Text("Scenario")
                            .frame(height: 53)
                           // .padding(.vertical, 12)
                            .padding(.horizontal, 15)
                            .foregroundColor( chatType == .scenario ? .white : Color.orangeMain)
                            .bold()
                            .font(.callout)
                            .background( chatType == .scenario ? Color.orangeMain : .clear)
                            .cornerRadius(15)
                            .padding(.leading, -8)
                    }
                    
                    Spacer()
                    
                    Button {
                        chatType = .timed
                    } label: {
                        Text("Timed")
                            .frame(height: 53)
                           // .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .foregroundColor( chatType == .timed ? .white : Color.orangeMain)
                            .bold()
                            .font(.callout)
                            .background( chatType == .timed ? Color.orangeMain : .clear)
                            .cornerRadius(15)
                            .padding(.trailing, -15)
                    }
                }
                .padding(.horizontal, 35)
            }
            
    
               
            
            Spacer()
           
            
        }.padding(.top, 120)
        
    }
      
    
}

struct CreateChatView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChatView()
    }
}

//
//  StartMessagingView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 4/25/24.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case create = 0
    case join
    
    var title: String{
        switch self {
        case .create:
            return "Create"
        case .join:
            return "Join"
        }
    }
    
    var iconName: String {
        switch self {
        case .create:
            return "plus.bubble"
        case .join:
            return "person.2.fill"
        }
    }
}

struct StartMessagingView: View {
    
    @State var selectedTab = 0
    @State var confirmed = false
    @Binding var messagingScreen: MessagingScreen
    
    var body: some View {
        VStack {
            // tab button
            VStack {
                ZStack{
                    HStack{
                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            Button {
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }.padding(5)
                }
                .background(Color.orangeA.opacity(0.2))
                .cornerRadius(35)
                .padding(.horizontal, 60)
                
                // settings
                
                TabView(selection: $selectedTab){
                    CreateChatView(confirmed: $confirmed)
                        .padding(20)
                        .background(confirmed ? Color.orangeA.opacity(0.2) : Color.clear)
                        .animation(.default)
                        .tag(0)
                    JoinChatView()
                        .tag(1)
                }
                
//                .frame(height: 500)
                .cornerRadius(20)
                .padding(20)
                .shadow(radius: 2, y: 1)

                
                Spacer()
                
                Button {
                    messagingScreen = .chatView
                } label: {
                    HStack {
                        Spacer()
                        Text(selectedTab == 0 ? "Create Room" : "Join Room")
                            .font(textFont(name: "helvetica-bold", size: 20))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding([.top, .bottom], 20)
                    .background(confirmed ? Color.orangeA : Color.orangeA.opacity(0.2))
                    .cornerRadius(40)
                }
                .disabled(!confirmed)
                .padding(20)
            }
            

           
        }
        
    }
    
    
}

extension StartMessagingView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .font(.system(size: 30))
                .foregroundColor(isActive ? .white : Color.orangeA )
            if isActive{
                Text(title)
                    .font(.system(size: 20))
                    .foregroundColor(isActive ? .white : Color.orangeA)
                    .bold()
            }
            Spacer()
        }
        // return Spacer()
        .frame(width: isActive ? .infinity : 100, height: 60)
        .background(isActive ? Color.orangeA.opacity(1) : .clear)
        .cornerRadius(30)
    }
    
}

struct StartMessagingView_Previews: PreviewProvider {
    static var previews: some View {
        StartMessagingView(messagingScreen: Binding.constant(.startMessagingOptionsView))
    }
}

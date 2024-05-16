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
    
    var body: some View {
        ZStack {
            Spacer()
            
            TabView(selection: $selectedTab){
                CreateChatView()
                    .tag(0)
                JoinChatView()
                    .tag(1)
            }
            
            
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
                    }.padding(6)
                }

                .background(Color.orangeMain.opacity(0.25))
                .cornerRadius(35)
            .padding(.horizontal, 20)
                Spacer()
            }.padding(.top, 30)
            
            
           
        }
        
    }
    
    
}

extension StartMessagingView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .font(.system(size: 30))
                .foregroundColor(isActive ? .white : Color.orangeMain )
            if isActive{
                Text(title)
                    .font(.system(size: 20))
                    .foregroundColor(isActive ? .white : Color.orangeMain)
                    .bold()
            }
            Spacer()
        }
        // return Spacer()
        .frame(width: isActive ? .infinity : 100, height: 60)
        .background(isActive ? Color.orangeMain.opacity(1) : .clear)
        .cornerRadius(30)
        
    }
    
}

struct StartMessagingView_Previews: PreviewProvider {
    static var previews: some View {
        StartMessagingView()
    }
}

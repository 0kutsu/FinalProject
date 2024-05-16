//
//  DropdownView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 5/9/24.
//

import SwiftUI

class DataModel{
    var iconName: String
    let title: String
    var destination: AnyView
    
    init(iconName: String, title: String, destination: AnyView) {
        self.iconName = iconName
        self.title = title
        self.destination = destination
    }
}


struct DropdownView: View {
    
   
    var icon: String
    var title: String
    var color: Color
    var ListOne: [DataModel]
    var listH: CGFloat = 0
    
    @State var showList = false
    var body: some View {
        VStack {
            
            
            ZStack{
                
                //dropdown cover
                HStack{
                    Image(systemName: icon)
                        .frame(width: 30)
                    Text(title)
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(showList ? 90 : 0))
                }.bold()
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(color)
                    .cornerRadius(15)
                    .onTapGesture {
                        withAnimation {
                            showList.toggle()
                        }
                    }
                    .zIndex(1)
                
                //dropdown
                ForEach(ListOne.indices, id: \.self) { item in
                    HStack{
                        Image(systemName:ListOne[item].iconName).frame(width: 30)
                        Text(ListOne[item].title)
                        Spacer()
                        
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(color.opacity(showList ? 1 : (1 - Double(item) * 0.3)))
                    .cornerRadius(15)
                    .offset(y: showList ? CGFloat(item * 58): CGFloat(item * 8))
                    .scaleEffect(showList ? 1 : (1 - Double(item) * 0.04))
                    .zIndex(CGFloat(item * -1))
                    .onTapGesture {
                        withAnimation {
                            ListOne[item].iconName = "checkmark.square"
                        }
                    }
                    
                }
                .offset(y: showList ? 58 : 0)
               
                
            }.padding(.horizontal)
           
            Spacer()
        }
            .frame(height: showList ? listH : 70)
        
    }
}






//struct JoinChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropdownView()
//    }
//}

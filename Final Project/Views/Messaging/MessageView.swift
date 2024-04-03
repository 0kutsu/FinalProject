//
//  MessageView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    var isFromCurrentUser: Bool = false
    var body: some View {
        if message.isFromCurrentUser() {
            HStack{
               
                HStack {
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 260, alignment: .topLeading)
                .background(Color(uiColor: .systemBlue))
                .cornerRadius(20)
                
                Image("default pfp")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 32, maxHeight: 32, alignment: .top)
                    .cornerRadius(16)
                    .padding(.bottom, 24)
                    .padding(.leading, 4)
                
            }
            .frame(maxWidth: 360, alignment: .trailing)
        } else {
            HStack{
                Image("default pfp")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 32, maxHeight: 32, alignment: .top)
                    .cornerRadius(16)
                    .padding(.bottom, 24)
                    .padding(.leading, 4)
                HStack {
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 260, alignment: .leading)
                .background(Color(uiColor: .lightGray))
                .cornerRadius(20)

            }
            .frame(maxWidth: 360, alignment: .leading)
        }
        
       
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(userUid: "123", text: "hewo como estas uwu", createdAt: Date()))
    }
}

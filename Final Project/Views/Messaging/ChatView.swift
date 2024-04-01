//
//  ChatView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = ""
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(chatViewModel.mockData) { message in
                        MessageView(message: message)
                    }
                }
            }
            HStack {
                TextField("send a message", text: $text, axis: .vertical)
                    .padding()
                Button {
                    if text.count > 2 {
                        chatViewModel.sendMessage(text: text)
                        text = ""
                    }
                   
                } label: {
                    Text("send")
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(50)
                        .padding(.trailing)
                }
            }
            .padding(.top)
            .background(Color(uiColor: .systemGray6))
             
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

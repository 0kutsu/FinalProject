//
//  ChatView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 3/20/24.
//

import SwiftUI

func fetchMessagesInView(chatViewModel: ChatViewModel) {
    Message.fetchMessages { result in
        switch result {
            case .success(let fetchmessages):
                chatViewModel.messages = fetchmessages
            case .failure(_):
                print("error fetching messages")
        }
    }
}

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = ""
    @EnvironmentObject var user: User
    @State var showingAddCardToSetView: Bool = false
    
    var body: some View {
        
        VStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 8) {
                        Text("")
                            .onAppear {
                                fetchMessagesInView(chatViewModel: chatViewModel)
                            }
                        ForEach(chatViewModel.messages) { message in
                            MessageView(message: message, showingAddCardToSetView: $showingAddCardToSetView)
                        }
                                
                    }
                }
                HStack {
                    TextField("send a message", text: $text, axis: .vertical)
                        .padding()
                        .autocorrectionDisabled()
                    Button {
                        if text.count > 2 {
                            chatViewModel.sendMessage(text: text)
                            Message.uploadMessage(Message(userUid: user.uid, text: text, createdAt: Date()))
                            text = ""
                        }
                        
                    } label: {
                        Text("send")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orangeMain)
                            .cornerRadius(50)
                            .padding(.trailing)
                    }
                }
                .padding(.top)
                .background(Color(uiColor: .systemGray6))
                
            }
            .background(.white)
            .sheet(isPresented: $showingAddCardToSetView) {
                AddCardToSetView(showingAddCardToSetView: $showingAddCardToSetView)
            }
        }
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(User())
    }
}

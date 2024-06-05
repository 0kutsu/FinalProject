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
    
    @State var prompt: String = ""
    @State var imageAnswer: Image = Image("")
    
    var body: some View {
        
        VStack {
            ChatToolBarView()
                .frame(height: 50)
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack() {
                        Text("")
                            .onAppear {
                                fetchMessagesInView(chatViewModel: chatViewModel)
                            }
                        // real
                        ForEach(chatViewModel.messages) { message in
                        // testing
//                        ForEach(chatViewModel.mockData) { message in
                            MessageView(message: message, prompt: $prompt, imageAnswer: $imageAnswer, showingAddCardToSetView: $showingAddCardToSetView)
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
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blueA)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 2, y: 1)
                    }
                    .padding(.horizontal, 7)

                }
                .background(Color(uiColor: .systemGray6), in: RoundedRectangle(cornerRadius: 30))
                .padding(.horizontal, 20)
                
            }
            .background(.white)
            .sheet(isPresented: $showingAddCardToSetView) {
                AddCardToSetView(prompt: prompt, imageAnswer: imageAnswer, showingAddCardToSetView: $showingAddCardToSetView)
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

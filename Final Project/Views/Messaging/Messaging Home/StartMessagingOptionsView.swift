//
//  StartMessagingOptionsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/23/24.
//

import SwiftUI

struct StartMessagingOptionsView: View {
    @Binding var messagingScreen: MessagingScreen
    var body: some View {
            VStack {
                Button {
                    messagingScreen = .createChatView
                } label : {
                    Text("Create Room")
                }
                
                Button {
                    messagingScreen = .joinChatView
                } label : {
                    Text("Join Room")
                }
            }
        }
}

struct StartMessagingOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        StartMessagingOptionsView(messagingScreen: Binding.constant(.startMessagingOptionsView))
    }
}

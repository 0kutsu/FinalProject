//
//  MessagingNavigationView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/17/24.
//

import SwiftUI

enum MessagingScreen {
    case startMessagingOptionsView, createChatView, joinChatView, chatView
}

struct MessagingNavigationView: View {
    @State var messagingScreen: MessagingScreen = .createChatView
    var body: some View {
        if messagingScreen == .createChatView {
            StartMessagingView(messagingScreen: $messagingScreen)
        }
        
        else if messagingScreen == .chatView {
            ChatView()
        }
    }
}

struct MessagingNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingNavigationView()
    }
}

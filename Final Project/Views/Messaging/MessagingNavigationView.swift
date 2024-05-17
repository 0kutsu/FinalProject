//
//  MessagingNavigationView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/17/24.
//

import SwiftUI

enum MessagingScreen {
    case startMessagingView, chatView
}

struct MessagingNavigationView: View {
    @State var messagingScreen: MessagingScreen = .startMessagingView
    var body: some View {
        if messagingScreen == .startMessagingView {
            StartMessagingView(messagingScreen: $messagingScreen)
        }
        else {
            ChatView()
        }
    }
}

struct MessagingNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingNavigationView()
    }
}

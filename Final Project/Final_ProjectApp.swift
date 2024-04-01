//
//  Final_ProjectApp.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/8/24.
//

import SwiftUI
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseStorage

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Final_ProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var user: User = User()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}

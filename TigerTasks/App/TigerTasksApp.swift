//
//  TigerTasksApp.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      Auth.auth().signInAnonymously()

    return true
  }
}


@main
struct TigerTasksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            TasksListView()
        }
    }
}

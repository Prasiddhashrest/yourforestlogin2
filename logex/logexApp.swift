//
//  logexApp.swift
//  logex
//
//  Created by Prasiddha Shrestha on 6/30/24.
//

import SwiftUI
import Firebase

@main
struct loginexperimentApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

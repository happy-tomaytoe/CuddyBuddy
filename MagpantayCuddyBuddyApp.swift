//
//  MagpantayCuddyBuddyApp.swift
//  MagpantayCuddyBuddy
//
//  Created by HPro2 on 3/17/25.
//

import SwiftUI
import SwiftData

@main
struct MagpantayCuddyBuddyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Food.self)
    }
}

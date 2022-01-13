//
//  BirthdayApp.swift
//  Shared
//
//  Created by Kevin Warshaw on 12/21/21.
//

import SwiftUI

@main
struct BirthdayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

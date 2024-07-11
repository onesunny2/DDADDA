//
//  DDADDAApp.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/4/24.
//

import SwiftUI

@main
struct DDADDAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SelectView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

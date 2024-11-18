//
//  ParliamentAppApp.swift
//  ParliamentApp
//
//  Created by Amir Ghari on 11/4/24.
//

import SwiftUI
import SwiftData

@main
struct ParliamentAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: MP.self)
        }
    }
}

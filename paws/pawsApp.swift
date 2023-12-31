//
//  pawsApp.swift
//  paws
//
//  Created by Francisco Serrano on 3/11/23.
//

import SwiftUI

@main
struct pawsApp: App {
    var body: some Scene {
        MenuBarExtra("Paws", systemImage: "pawprint.fill") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}

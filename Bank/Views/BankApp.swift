//
//  BankApp.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/15/24.
//

import SwiftUI

@main
struct BankApp: App {
    @StateObject private var gameManager = GameManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                GameSetupView()
                    .preferredColorScheme(.light)
                    .environmentObject(gameManager)
            }
        }
    }
}


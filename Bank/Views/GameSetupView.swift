//
//  GameSetupView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

enum NavigationDestination {
    case playersView
    case playGameView
    case summaryView
}


struct GameSetupView: View {
    @State private var showingAddPlayersView = false
    @State private var showingLeaderboardView = false
    @State private var showingSettingsView = false
    @EnvironmentObject var gameManager: GameManager
    @State private var path = NavigationPath()
    
    //    @State private var showPlayersView = false // Add this state
    
    var body: some View {
        NavigationStack(path: $path) {
            
            ZStack {
                Color.maroon
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.20))
                VStack {
                    
                    Spacer()
                    
                    Text("Bank!")
                        .font(.custom("SnellRoundhand-Black", size: 50))
                        .bold()
                        .foregroundColor(.white)
                        .foregroundColor(.white)
                    
                    NavigationLink("Start Game", value: NavigationDestination.playersView)
                        .foregroundColor(.white)
                        .frame(width: 140, height: 40)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(50)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            showingLeaderboardView = true
                        }) {
                            Image(systemName: "person.3.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .bold()
                                .padding(16)
                        }
                        .padding()
                        .font(.headline)
                        .foregroundColor(.gray)
                        .popover(isPresented: $showingLeaderboardView) {
                            LeaderboardView()
                        }
                        
                        Spacer()
                        Button(action: {
                            showingSettingsView = true
                        }) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .bold()
                                .padding(16)
                        }
                        .padding()
                        .font(.headline)
                        .foregroundColor(.gray)
                        .popover(isPresented: $showingSettingsView) {
                            SettingsView()
                        }
                    }
                }
            }
            
        }
        .navigationDestination(for: NavigationDestination.self) {
            destination in
            switch destination {
            case .playersView:
                PlayersView(path: $path)
                    .environmentObject(gameManager)
            case .playGameView:
                PlayGameView(path: $path)
                    .environmentObject(gameManager)
            case .summaryView:
                GameSummaryView(path: $path)
                    .environmentObject(gameManager)
            }
        }
    }
}

#Preview {
    GameSetupView()
        .environmentObject(GameManager())
}

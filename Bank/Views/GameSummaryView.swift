//
//  GameSummaryView.swift
//  Bank
//
//  Created by Ronald Muñoz on 1/24/25.
//

import SwiftUI

struct GameSummaryView: View  {
    @EnvironmentObject var gameManager: GameManager
    @State private var showingStartGameWindow: Bool = false

    var body: some View {
        NavigationStack{
            List {
                Section{
                    ForEach(gameManager.players.sorted { $0.points > $1.points }) { player in
                        PlayerRowView(player: player)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Capsule().fill(Color.black.opacity(0.1))
                        .padding(2))
                }
            }
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Game Summary")
        }
        
        Spacer()
        
        Button("End Game") {
            resetGame()
        }
        .foregroundColor(.white)
        .frame(width: 250, height: 40)
        .padding()
        .background(Color.blue)
        .cornerRadius(50)
        .fullScreenCover(isPresented: $showingStartGameWindow) {
            GameSetupView()
        }
    }
    
    func resetGame() {
        // Convert gameManager.players to PlayerResult array with correct positions
        let playerResults = gameManager.players.enumerated().map { (index, player) in
            PlayerResult(name: player.name, score: player.points, position: index + 1)
        }
        
        // Update the leaderboard
        addPlayersToLeaderboard(players: playerResults)
        
        showingStartGameWindow = true
        gameManager.players.removeAll()
        
        // Reset the game
        showingStartGameWindow = true
        gameManager.players.removeAll()
    }
}

#Preview {
    GameSummaryView()
        .environmentObject(GameManager(players: Player.final_game_samples))
}

//
//  GameSummaryView.swift
//  Bank
//
//  Created by Ronald Muñoz on 1/24/25.
//

import SwiftUI

struct GameSummaryView: View  {
    @EnvironmentObject var gameManager: GameManager
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
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
            
            Spacer()
            
            Button("End Game") {
                resetGame()
            }
            .foregroundColor(.white)
            .frame(width: 250, height: 40)
            .padding()
            .background(Color.blue)
            .cornerRadius(50)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func resetGame() {
        // Convert gameManager.players to PlayerResult array with correct positions
        let playerResults = gameManager.players.enumerated().map { (index, player) in
            PlayerResult(name: player.name, score: player.points, position: index + 1)
        }
        
        // Update the leaderboard
        addPlayersToLeaderboard(players: playerResults)
        
        gameManager.resetGame()
        
        path = NavigationPath()
    }
    
}

#Preview {
    GameSummaryView(path: .constant(NavigationPath()))
        .environmentObject(GameManager(players: Player.final_game_samples))
}

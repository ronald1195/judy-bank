//
//  GameViewModel.swift
//  Bank
//
//  Created by Ronald Muñoz on 2/3/25.
//
import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    //... other game-related data and methods...
    
    init() {
         // Default init with no players
     }

     init(players: [Player]) {
         self.players = players
     }
    
    func resetGame() {
        players.removeAll()
        // Reset other properties to their initial values
        // Example: self.currentRound = 0
        // Example: self.isGameOver = false
    }
}

//
//  PlayerResult.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/18/25.
//

import Foundation

struct PlayerResult: Codable, Equatable{
    var name: String
    var score: Int
    var position: Int
}

func saveLeaderboard(leaderboard: [PlayerResult]) {
    if let encodedData = try? JSONEncoder().encode(leaderboard) {
        UserDefaults.standard.set(encodedData, forKey: "leaderboard")
    }
}

func loadLeaderboard() -> [PlayerResult] {
    guard let savedData = UserDefaults.standard.data(forKey: "leaderboard") else {
        return []
    }
    return try! JSONDecoder().decode([PlayerResult].self, from: savedData)
}

func addPlayersToLeaderboard(players: [PlayerResult]) {
    var currentLeaderboard = loadLeaderboard()
    
    currentLeaderboard += players
    
    currentLeaderboard.sort { $0.score > $1.score }
    
    let top10Players = Array(currentLeaderboard.prefix(10))
    
    let updatedLeaderboard = top10Players.enumerated().map { (index, player) in
        PlayerResult(name: player.name, score: player.score, position: index + 1)
    }
    
    saveLeaderboard(leaderboard: updatedLeaderboard)
}

func clearLeaderboard() {
    UserDefaults.standard.removeObject(forKey: "leaderboard")
    UserDefaults.standard.synchronize()
}

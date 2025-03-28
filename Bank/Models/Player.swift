//
//  Player.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import Foundation

class Player: Identifiable, Hashable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let name: String
    var points: Int
    private(set) var active: Bool // Restrict external writes
    
    init(name: String, points: Int, active: Bool = true) {
        self.name = name
        self.points = points
        self.active = active
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func addPoints(pointsToBeAdded: Int) {
        if self.active == false {
            print("Player \(name) is inactive and cannot receive points.")
            return
        }
        
        self.points += pointsToBeAdded
        self.active = false // Automatically mark player as inactive
    }
    
    func resetStatus() {
        self.active = true
    }
}

extension Player {
    static var samples: [Player] = [
        .init(name: "Peter Friese", points: 0),
        .init(name: "Alex Kudelka",  points: 0),
        .init(name: "Alexis Santos", points: 0),
        .init(name: "Allison Mcentire",  points: 0),
        .init(name: "Anum Mian",  points: 0)
    ]
    
    static var final_game_samples: [Player] = [
        .init(name: "Peter Friese", points: 1000),
        .init(name: "Alex Kudelka",  points: 102),
        .init(name: "Alexis Santos", points: 200),
        .init(name: "Allison Mcentire",  points: 4)
    ]
    
    static var sample = samples[0]
    
    static var empty = Player(name: "", points: 0)
}


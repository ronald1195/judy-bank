//
//  Player.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import Foundation

//struct Player: Identifiable, Hashable{
//    let id = UUID()
//    let name: String
//    var points: Int
//    var active = true
//    
//    mutating func addPoints(pointsToBeAdded : Int) {
//        points += pointsToBeAdded
//    }
//}

class Player: Identifiable, Hashable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let name: String
    var points: Int
    var active = true
    
    init(name: String, points: Int, active: Bool = true) {
        self.name = name
        self.points = points
        self.active = active
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func addPoints(pointsToBeAdded : Int) {
        self.points += pointsToBeAdded
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
    
    static var sample = samples[0]
    
    static var empty = Player(name: "", points: 0)
}


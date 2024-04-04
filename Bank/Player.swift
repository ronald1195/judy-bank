//
//  Player.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import Foundation

struct Player: Identifiable, Hashable{
    let id = UUID()
    let name: String
    let points: Int
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

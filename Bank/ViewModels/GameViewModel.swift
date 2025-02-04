//
//  GameViewModel.swift
//  Bank
//
//  Created by Ronald Muñoz on 2/3/25.
//
import Foundation

class GameViewModel: ObservableObject {
    @Published var players: [Player] = []
    //... other game-related data and methods...
}

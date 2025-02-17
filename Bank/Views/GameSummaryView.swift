//
//  GameSummaryView.swift
//  Bank
//
//  Created by Ronald Muñoz on 1/24/25.
//

import SwiftUI

struct GameSummaryView: View  {
    @EnvironmentObject var gameManager: GameManager

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
    }
}

#Preview {
    GameSummaryView()
        .environmentObject(GameManager(players: Player.final_game_samples))
}

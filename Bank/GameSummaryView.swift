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
                ForEach(gameManager.players.sorted { $0.points > $1.points }) { player in
                    HStack {
                        Text(player.name)
                        Spacer()
                        Text("\(player.points) pts")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Game Summary")
        }
        
    }
}

#Preview {
    GameSummaryView()
        .environmentObject(GameManager(players: Player.final_game_samples))
}

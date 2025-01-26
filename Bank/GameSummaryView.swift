//
//  GameSummaryView.swift
//  Bank
//
//  Created by Ronald Muñoz on 1/24/25.
//

import SwiftUI

struct GameSummaryView: View  {
    @Binding var players: [Player]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(players.sorted { $0.points > $1.points }) { player in
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
    GameSummaryView(players: .constant(Player.final_game_samples))
}

//
//  PlayersBankView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/29/24.
//

import SwiftUI

struct MultiselectRow: View {
    
    var player: Player
    @Binding var selectedItems: Set<UUID>
    
    var isSelected: Bool {
        selectedItems.contains(player.id)
    }
    
    var body: some View {
        HStack {
            Text(player.name)
            Spacer()
            Text("$ \(player.points)")
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        
    }
}

struct PlayersBankView: View {
    @State var bankingPoints: Int
    @State var players: [Player]
    @State private var selectedPlayers = Set<UUID>()
    
    var body: some View {
        
        NavigationView {
            List(players, selection: $selectedPlayers) { player in
                MultiselectRow(player: player, selectedItems: $selectedPlayers)
            }
//            .toolbar { EditButton() }
        }
    }
}

#Preview {
    PlayersBankView(bankingPoints: 100, players: Player.samples)
}

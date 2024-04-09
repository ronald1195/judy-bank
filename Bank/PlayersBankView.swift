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
    @Binding var newPoints: Int
    
    var isSelected: Bool {
        selectedItems.contains(player.id)
    }
    
    var body: some View {
        HStack {
            Text(player.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
                Text("$ \(player.points + newPoints)")
            }
            else {
                Text("$ \(player.points)")
            }
        }
        
    }
}

struct PlayersBankView: View {
    @State var bankingPoints: Int
    @State var players: [Player]
    @State private var selectedPlayers = Set<UUID>()
    
    var body: some View {
        
        VStack{
            NavigationView {
                List(players, selection: $selectedPlayers) { player in
                    MultiselectRow(player: player, selectedItems: $selectedPlayers, newPoints: $bankingPoints)
                }
    //            .toolbar { EditButton() }
            }
            Button(action: {applyPointsToUsers()}, label: {
                Text("Apply Points")
            })
        }
        
    }
    
    func applyPointsToUsers() {
        for index in players.indices {
            let player = players[index]
            if selectedPlayers.contains(player.id) {
                players[index].addPoints(pointsToBeAdded: bankingPoints)
            }
        }
    }
}

#Preview {
    PlayersBankView(bankingPoints: 100, players: Player.samples)
}

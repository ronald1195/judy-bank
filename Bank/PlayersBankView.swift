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
            if isSelected && player.active && newPoints > 0{
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
                Text("$ \(player.points + newPoints)")
            }
            else {
                Text("$ \(player.points)")
            }
        }
        .disabled(newPoints == 0) // Disable interaction when bankingPoints is 0
        .contentShape(Rectangle()) // Make the whole row tappable
        .onTapGesture {
            toggleSelection()
        }
    }

    private func toggleSelection() {
        if isSelected {
            selectedItems.remove(player.id)
        } else if player.active && player.active && newPoints > 0 {
            selectedItems.insert(player.id)
        }
    }
}

struct PlayersBankView: View {
    @State var bankingPoints: Int
    @State var players: [Player]
    @State private var selectedPlayers = Set<UUID>()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
            NavigationView {
                List(players, selection: $selectedPlayers) { player in
                    MultiselectRow(player: player, selectedItems: $selectedPlayers, newPoints: $bankingPoints)

                }
            }
            Button(action: { applyPointsToUsers() }, label: {
                            Text("Apply Points")
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(bankingPoints == 0 ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        })
                        .disabled(bankingPoints == 0) // Disable when no points
                        .padding()
        }
    }
   
    func applyPointsToUsers() {
        for index in players.indices {
            let player = players[index]
            if selectedPlayers.contains(player.id) {
                players[index].addPoints(pointsToBeAdded: bankingPoints)
            }
            isPresented = false
        }
    }
    
}

#Preview {
    PlayersBankView(bankingPoints: 100, players: Player.samples, isPresented: .constant(true))

}

#Preview {
    PlayersBankView(bankingPoints: 0, players: Player.samples, isPresented: .constant(true))

}



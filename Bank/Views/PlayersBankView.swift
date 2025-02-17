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
    @EnvironmentObject var gameManager: GameManager
    @State private var selectedPlayers = Set<UUID>()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
            List(gameManager.players, selection: $selectedPlayers) { player in
                MultiselectRow(player: player, selectedItems: $selectedPlayers, newPoints: $bankingPoints)
                    .font(.headline)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Capsule().fill(Color.black.opacity(0.1)).padding(2))
            }
            .scrollContentBackground(.hidden)

            
            Button(action: { applyPointsToUsers() }, label: {
                            Text("Apply Points")
                                .frame(width: 300, height: 75)
                                .background(bankingPoints == 0 ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .font(.headline)
                                .background(Color.blue)
                                .cornerRadius(50)
                        })
                        .disabled(bankingPoints == 0) // Disable when no points
                        .padding()
        }
    }
   
    func applyPointsToUsers() {
        for index in gameManager.players.indices {
            let player = gameManager.players[index]
            if selectedPlayers.contains(player.id) {
                gameManager.players[index].addPoints(pointsToBeAdded: bankingPoints)
            }
            isPresented = false
        }
    }
    
}

#Preview {
    PlayersBankView(bankingPoints: 100, isPresented: .constant(true))
        .environmentObject(GameManager(players: Player.samples))

}

#Preview {
    PlayersBankView(bankingPoints: 0, isPresented: .constant(true))
        .environmentObject(GameManager(players: Player.samples))
}



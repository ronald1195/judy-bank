import SwiftUI
import os
import Foundation

struct AddPlayerView: View {
//    @Binding var newPlayer: [Player] // Binding to parent view
    @State private var localPlayers = [Player]() // Local state for added players
    @State private var username: String = "" // Temporary username input
    @Environment(\.dismiss) var dismiss // Environment dismiss for closing the sheet
    @State private var popupMessageTextShowing = false
    @State private var popupNameText = ""
    @EnvironmentObject var gameManager: GameManager

    var body: some View {
        VStack {
            // Show a popup message when a player is added
            if popupMessageTextShowing {
                Text("\(popupNameText) added to the game")
                    .foregroundColor(.green)
                    .transition(.opacity)
                    .padding(.bottom, 10)
            }

            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)

                HStack {
                    Button(action: complete, label: {
                        Text("Complete")
                    })
                    Spacer()
                    Button(action: addPlayer, label: {
                        Text("Add more")
                    })
                }
                .padding(.horizontal, 70)
                .buttonStyle(.bordered)
            }
        }
    }

    private func addPlayer() {
        // Check if username is not empty
        guard !username.isEmpty else { return }

        // Add the player to the local state
        popupNameText = username
        print("Player added: \(username)")
//        newPlayer.append(.init(name: username, points: 0))
        localPlayers.append(.init(name: username, points: 0))
        displayActionMessage()
        username = "" // Clear the input field
        
      
    }

    private func complete() {
        if !username.isEmpty {
            addPlayer()
        }
//         Commit local changes to the binding and dismiss the sheet
        gameManager.players.append(contentsOf: localPlayers)
        dismiss()
    }

    private func displayActionMessage() {
        // Toggle the popup message on and off
        withAnimation {
            popupMessageTextShowing = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                popupMessageTextShowing = false
            }
        }
    }
}

#Preview {
    AddPlayerView()
        .environmentObject(GameManager())
}

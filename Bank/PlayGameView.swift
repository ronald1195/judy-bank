//
//  PlayGameView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/29/24.
//

import SwiftUI

struct PlayGameView: View {
    var roundsToPlay = 10
    @State var currentRound = 1
    @State var gamePoints = 0
//    @Binding var players: [Player]
    @EnvironmentObject var gameManager: GameManager
    @State var roundPoints = 0
    @State private var showingPlayersSheet = false
    @State private var showingPlayerListSheet = false

    var body: some View {
        VStack {
            if currentRound <= roundsToPlay {
                
                Button("Back"){
                    showingPlayerListSheet = true
                }
                .fullScreenCover(isPresented: $showingPlayerListSheet) {
//                    PlayersView(players: $players)
                    PlayersView()
                }
                
                Text("Round: \(currentRound) / \(roundsToPlay)")
                    .font(.headline)
                    .padding(.bottom, 20)
                    .foregroundStyle(Color.primary)
                 
                Spacer()
                
                CalculatorView(roundPoints: $roundPoints, round: $currentRound, players: $gameManager.players)
                
                Button(action: {bankButtonClick()}, label: {
                    Text("Bank!")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 75)
                        .border(Color.red, width: 2)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .padding(.top)
                })
                .sheet(isPresented: $showingPlayersSheet) {
                    PlayersBankView(bankingPoints: roundPoints, isPresented: $showingPlayersSheet)
                }
                
                Text("Round points: $\(roundPoints)")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(Color.primary)
                 
                
            }
            else {
//                 Show the GameSummaryView once the game is over
                GameSummaryView()
            }
        }
    }
    
    private func bankButtonClick() {
        gamePoints += roundPoints
        showingPlayersSheet.toggle()
    }
}

#Preview {
    PlayGameView()
        .environmentObject(GameManager())
}

#Preview {
    PlayGameView()
        .environmentObject(GameManager(players: Player.final_game_samples))
}

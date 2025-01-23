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
    @Binding var players: [Player]
    @State var roundPoints = 0
    @State private var showingPlayersSheet = false

    var body: some View {
        Text("Round: \(currentRound) / \(roundsToPlay)")
            .font(.headline)
            .padding(.bottom, 20)
         
        Spacer()
        if currentRound <= roundsToPlay {
            CalculatorView(roundPoints: $roundPoints, round: $currentRound, players: $players)
            
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
                    .padding(.vertical, 20)
            })
            .sheet(isPresented: $showingPlayersSheet) {
                PlayersBankView(bankingPoints: roundPoints, players: players, isPresented: $showingPlayersSheet)
            }
            
            Text("Round points: $\(roundPoints)")
                .font(.headline)
                .padding()
            
        }
        else {
            Text("check results")
        }
    }
    
    func bankButtonClick() {
        gamePoints += roundPoints
        showingPlayersSheet.toggle()
    }
}

#Preview {
    PlayGameView(players: .constant([Player]()))
}

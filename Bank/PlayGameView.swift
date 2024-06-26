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
         
        if currentRound <= roundsToPlay {
            CalculatorView(roundPoints: $roundPoints, round: $currentRound)
            
            Button(action: {bankButtonClick()}, label: {
                Text("Bank!")
                    .foregroundColor(Color.black)
                    .frame(width: 306.0, height: 60.0)
                    .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
            })
            .sheet(isPresented: $showingPlayersSheet) {
                PlayersBankView(bankingPoints: roundPoints, players: players, isPresented: $showingPlayersSheet)
            }
            
            Text("Round points: $\(roundPoints)")
            
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

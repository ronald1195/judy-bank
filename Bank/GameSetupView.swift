//
//  GameSetupView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

struct GameSetupView: View {
    @State private var showingAddPlayersView = false
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        ZStack {
            Color.maroon
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.black.opacity(0.20))
            VStack {
                
                Text("Bank!")
                    .font(.custom("SnellRoundhand-Black", size: 50))
                    .bold()
                    .foregroundColor(.white)
                    .foregroundColor(.white)
                
                Button("Start Game") {
                    showingAddPlayersView = true
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(25)
                .fullScreenCover(isPresented: $showingAddPlayersView) {
                    PlayersView()
                }
            }
        }
    }
}

#Preview {
    GameSetupView()
        .environmentObject(GameManager())
}

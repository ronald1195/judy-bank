//
//  GameSetupView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

struct GameSetupView: View {
    @State private var showingAddPlayersView = false
    
    var body: some View {
        ZStack {
            Color.bank_beige
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("bank")
                    .resizable()
                    .scaledToFit()
                
                Button("Start Game") {
                    showingAddPlayersView = true
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .fullScreenCover(isPresented: $showingAddPlayersView) {
                    PlayersView()
                }
            }
        }
    }
}

#Preview {
    GameSetupView()
}

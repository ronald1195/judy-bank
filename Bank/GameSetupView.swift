//
//  GameSetupView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

struct GameSetupView: View {
    @State var showingAddPlayersView = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Image("bank")
                        .resizable()
                        .scaledToFit()
                        .padding()

                    NavigationLink(destination: PlayersView()) {
                        Text("Start Game")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .background(Color.red)
        }
    }
}

#Preview {
    GameSetupView()
}

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
//        VStack(content: {
//            HStack(content: {
//                Button(action: {self.showingAddPlayersView.toggle()}, label: {
//                    Text("Start game")
//                })
//                .sheet(isPresented: $showingAddPlayersView) {
//                    PlayersView()
//                }
//            })
//            .padding(32.331)
//            .buttonStyle(.bordered)
//        })
//        
        NavigationView {
                    VStack {
                        NavigationLink(destination: PlayersView()) {
                            Text("Start Game")
                        }
                    }
                }
        
    }
    
    
}

#Preview {
    GameSetupView()
}

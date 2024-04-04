//
//  PlayersView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

struct PlayersView: View {
    @State var newPlayer = Player.empty
    @State var numbers = [1,2,3,4]
    @State var players = [Player]()
    @State var pp = Player.samples
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(players, id: \.self) { player in
                        PlayerRowView(player: player)
                    }
                    .onDelete(perform: delete)
                }
                .navigationBarTitle("Players")
                .navigationBarItems(trailing: Button("Add", action: addItemToRow)
                    .sheet(isPresented: $showingSheet) {
                        AddPlayerView(newPlayer: $players)
                    })
        }
       
        
        if players.isEmpty {
                    Text("Start by adding some players...")
                        .multilineTextAlignment(.center)
                        .padding()
                        .position(CGPoint(x: UIScreen.main.bounds.size.width/2, y:-UIScreen.main.bounds.height/6))
                        .foregroundStyle(.gray)
        }
       
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Start Game!")
        })
    }
    
    private func addItemToRow() {
        showingSheet.toggle()
    }
    
    private func delete(at offsets: IndexSet) {
        if let first = offsets.first {
                    players.remove(at: first)
                }
    }
}

#Preview {
    PlayersView()
}

//
//  PlayersView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

struct PlayersView: View {
//    @State var newPlayer = Player.empty
    @State var numbers = [1,2,3,4]
//    @State var players = Player.samples
//    @State var players = [Player]()
    @Binding var players: [Player]
    @State private var showingSheet = false
    @State private var showingAddPlayerView = false
    @State var gameViewActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                if players.isEmpty {
                    // First State: No players in the list
                    Text("No players added yet...")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundStyle(Color.gray)
                    
                    NavigationLink(destination: AddPlayerView(newPlayer: $players)) {
                        Text("Add Players")
                           .font(.headline)
                           .foregroundColor(.white)
                           .padding()
                           .frame(width: 150)
                           .background(Color.blue)
                           .cornerRadius(50)
                           .padding(.horizontal)
                        
                    }
                } else {
                    // Second State: Players exist in the list
                    List {
                        ForEach(players, id: \.self) { player in
                            PlayerRowView(player: player)
                        }
                        .onDelete(perform: deletePlayer)
                    }
                    .navigationBarTitle("Players")
                    
                    HStack {
                        Button(action: {
                            print("Game started with players: \(players.map { $0.name })")
                            gameViewActive = true
                        }) {
                            Text("Start Game")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(players.isEmpty ? Color.gray : Color.green)
                                .frame(width: 150)
                                .cornerRadius(50)
                                .fullScreenCover(isPresented: $gameViewActive) {
                                    PlayGameView(players: $players)
                                }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: AddPlayerView(newPlayer: $players)) {
                            Text("Add more")
                               .font(.headline)
                               .foregroundColor(.white)
                               .padding()
                               .frame(width: 150)
                               .background(Color.blue)
                               .cornerRadius(50)
                               .padding(.horizontal)
                            
                        }
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $showingAddPlayerView) {
                AddPlayerView(newPlayer: $players)
            }
        }
    }
    

        private func deletePlayer(at offsets: IndexSet) {
            players.remove(atOffsets: offsets)
        }
        
        
        
////        if gameViewActive {
////            PlayGameView(players: $players)
////        }
//        
////        else {
////        ZStack {
//        if players.isEmpty {
//            VStack {
//                Text("Start by adding some players..")
//                    .font(.headline)
//                    .padding()
//                
//                Button("Add", action: addItemToRow)
//                    .sheet(isPresented: $showingSheet) {
//                        AddPlayerView(newPlayer: $players)
//                    }
//            }
//        } else {
//            VStack {
//                NavigationView {
//                    List {
//                        ForEach(players, id: \.self) { player in
//                            PlayerRowView(player: player)
//                        }
//                        .onDelete(perform: delete)
//                    }
//                    .navigationBarTitle("Players")
//    
//                
////                    if players.isEmpty {
////                        Text("Start by adding some players...")
////                            .multilineTextAlignment(.center)
////                            .padding()
////                            .position(CGPoint(x: UIScreen.main.bounds.size.width/2, y:-UIScreen.main.bounds.height/6))
////                            .foregroundStyle(.gray)
////    //                    Button("Add Players") {
////    //                        addPlayerSheet = true
////    //                    }
////    //                    .foregroundColor(.white)
////    //                    .padding()
////    //                    .background(Color.blue)
////    //                    .cornerRadius(8)
////    //                    .sheet(isPresented: $addPlayerSheet) {
////    //                        AddPlayerView(newPlayer: $players)
////    //                    }
////                    }
//    //                else {
//    //                    Button(action: {startGame()}, label: {
//    //                        Text("Start Game!")
//    //                        .foregroundColor(.white)
//    //                        .padding()
//    //                        .background(Color.blue)
//    //                        .cornerRadius(8)
//    //                    })
//    //                }
//                }
//                
//                Button(action: {startGame()}, label: {
//                    Text("Start Game!")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(8)
//                    .fullScreenCover(isPresented: $gameViewActive) {
//                        PlayGameView(players: $players)
//                    }
//                    .cornerRadius(50)
//                })
//            }
//        }
//           
//        
//            
//    }
//    
//    private func addItemToRow() {
//        showingSheet.toggle()
//    }
//    
//    private func delete(at offsets: IndexSet) {
//        if let first = offsets.first {
//                    players.remove(at: first)
//                }
//    }
//    
}

#Preview {
    PlayersView(players: .constant([Player]()))
    
}

#Preview {
    PlayersView(players: .constant(Player.samples))
}

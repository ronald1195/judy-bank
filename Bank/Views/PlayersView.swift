//
//  PlayersView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/24/24.
//

import SwiftUI

struct PlayersView: View {
    @State private var showingSettingsView = false
    @State private var showingSheet = false
    @State private var showingAddPlayerView = false
    @State var gameViewActive = false
    @EnvironmentObject var gameManager: GameManager
    @State private var backButtonTapped = false
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            if gameManager.players.isEmpty {
                // First State: No players in the list
                ZStack{
                    Text("No players added yet...")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundStyle(Color.gray)
                    
                    VStack{
                        HStack {
                            Button(action: homeButonAction) {
                                Image(systemName: "house")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(16)
                            }
                            .padding()
                            .font(.headline)
                            .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                showingAddPlayerView = true
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 45))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(16)
                                    .background(
                                        Circle()
                                            .fill(Color.blue)
                                    )
                            }
                            .padding(.trailing, 20)
                            .padding(.bottom, 20)
                            .sheet(isPresented: $showingAddPlayerView) {
                                AddPlayerView()
                            }
                        }
                    }
                }
            }
            else {
                // Second State: Players exist in the list
                HStack {
                    Button(action: homeButonAction) {
                        Image(systemName: "house")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .bold()
                            .padding(16)
                    }
                    .padding(.horizontal)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .fullScreenCover(isPresented: $showingSettingsView) {
                        GameSetupView()
                    }
                    
                    Spacer()
                }
                List {
                    Section{
                        ForEach(gameManager.players, id: \.self) { player in
                            PlayerRowView(player: player)
                        }
                        .onDelete(perform: deletePlayer)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Capsule().fill(Color.black.opacity(0.1))
                            .padding(2))
                        
                    } header: { Text("Players") }
                }
                .scrollContentBackground(.hidden)
                
                HStack {
                    
                    Button(action: {
                        showingAddPlayerView = true
                    }) {
                        Text("Add more")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 60)
                            .background(Color.blue)
                            .cornerRadius(50)
                    }.sheet(isPresented: $showingAddPlayerView) {
                        AddPlayerView()
                    }
                    
                    Spacer()
                    
                    NavigationLink("Start Game", value: NavigationDestination.playGameView)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 60)
                        .background(gameManager.players.isEmpty ? Color.gray : Color.green)
                        .cornerRadius(50)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    private func deletePlayer(at offsets: IndexSet) {
        gameManager.players.remove(atOffsets: offsets)
    }
    
    private func homeButonAction() {
        path = NavigationPath()
    }
}



#Preview {
    PlayersView(path: .constant(NavigationPath()))
        .environmentObject(GameManager())
}

#Preview {
    PlayersView(path: .constant(NavigationPath()))
        .environmentObject(GameManager(players: Player.samples))
}

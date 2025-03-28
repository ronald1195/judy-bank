//
//  LeaderboardView.swift
//  Bank
//
//  Created by Ronald Muñoz on 2/18/25.
//

import SwiftUI

struct LeaderboardView: View {
    @State private var leaderboardIsEmpty = false
    @State private var leaderboardData: [PlayerResult] = []
    
    var body: some View {
        NavigationStack {
            // If the leaderboard is empty
            if leaderboardIsEmpty {
                VStack {
                    Spacer()
                    Text("No players have made it to the leaderboard yet!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
                .onAppear {
                    checkLeaderboard()
                }
                .foregroundStyle(.secondary)
            }
            // Once there is player data in the leaderboard
            else {
                List {
                    ForEach(leaderboardData, id: \.name) { player in
                        HStack {
                            Text("\(leaderboardData.firstIndex(of: player)! + 1).")
                                .frame(width: 30, alignment: .leading)
                            Text(player.name)
                            Spacer()
                            Text("\(player.score) pts")
                        }
                        .frame(height: 40)
                        .font(.title2)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Capsule().fill(Color.black.opacity(0.1))
                        .padding(2))
                }
                .scrollContentBackground(.hidden)
                .navigationBarTitle("Leaderboard")
                .onAppear {
                    checkLeaderboard()
                }
            }
        }
    }
    
    func checkLeaderboard() {
        leaderboardData = loadLeaderboard()
        leaderboardIsEmpty = leaderboardData.isEmpty
    }
}

#Preview {
    clearLeaderboard()
    return LeaderboardView()
}

#Preview {
    let testLeaderboard = [
        PlayerResult(name: "Alice", score: 1000, position: 1),
        PlayerResult(name: "Bob", score: 900, position: 2),
        PlayerResult(name: "Charlie", score: 800, position: 1),
        PlayerResult(name: "David", score: 700, position: 2),
        PlayerResult(name: "Eve", score: 600, position: 1),
    ]
    
    // Save the test leaderboard data
    saveLeaderboard(leaderboard: testLeaderboard)
    
    return LeaderboardView()
}

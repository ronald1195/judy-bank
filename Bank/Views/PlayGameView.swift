import SwiftUI

struct PlayGameView: View {
    var roundsToPlay = 10
    @State var currentRound = 1
    @State var gamePoints = 0
    @EnvironmentObject var gameManager: GameManager
    @State var roundPoints = 0
    @State private var showingPlayersSheet = false
    @State private var navigateToSummary = false // Add this state
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            if currentRound <= roundsToPlay {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                            .bold()
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("Round: \(currentRound) / \(roundsToPlay)")
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                        .padding(.horizontal)
                }
                
                Spacer()
                
                CalculatorView(roundPoints: $roundPoints, round: $currentRound, players: $gameManager.players)
                
                Button(action: { bankButtonClick() }, label: {
                    Text("Bank!")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 75)
                        .border(Color.red, width: 2)
                        .background(Color.red)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .padding(.top)
                })
                .sheet(isPresented: $showingPlayersSheet) {
                    PlayersBankView(bankingPoints: roundPoints, isPresented: $showingPlayersSheet)
                }
                
                Text("Round points: $\(roundPoints)")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(Color.primary)
            }
            else {
                GameSummaryView(path: $path)
                    .environmentObject(gameManager)
            }
        }
        .onChange(of: currentRound, initial: false) {
            if currentRound > roundsToPlay {
                navigateToSummary = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func bankButtonClick() {
        gamePoints += roundPoints
        showingPlayersSheet.toggle()
        if currentRound >= roundsToPlay {
            navigateToSummary = true
        }
    }
}

#Preview {
    PlayGameView(path: .constant(NavigationPath()))
        .environmentObject(GameManager(players: Player.samples))
}

#Preview {
    PlayGameView(path: .constant(NavigationPath()))
        .environmentObject(GameManager(players: Player.final_game_samples))
}

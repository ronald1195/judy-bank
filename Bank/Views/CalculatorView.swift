//
//  CalculatorView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/19/24.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var roundPoints: Int
    @State var turn = 0
    @Binding var round: Int
    @Binding var players: [Player] // Pass players as a binding
    @State private var isPressed = false // Tracks whether the button is pressed]
    @State private var rollingUserIndex = 0

    var body: some View {
//        GeometryReader { geometry in
            VStack{
                HStack{
                    if players.isEmpty {
                        Text("No Players...")
                    }
                    else {
                        Text("Now rolling:  \(players[rollingUserIndex].name)")
                    }
                    Spacer()
                }
                .padding(.horizontal, 60)
                .padding(.bottom, 10)
                .foregroundStyle(.secondary)
                .font(.title3)
                
                HStack{
                    Button(action: {
                        addValue(value: 2)
                    }, label: {
                        Text("2")
                            .font(.title)
                            .frame(width:90, height: 90)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 3)
                    }, label: {
                        Text("3")
                            .font(.title)
                            .frame(width:90, height: 90)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 4)
                    }, label: {
                        Text("4")
                            .font(.title)
                            .frame(width:90, height: 90)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                }
                HStack{
                    Button(action: {
                        addValue(value: 5)
                    }, label: {
                        Text("5")
                            .font(.title)
                            .frame(width:90, height: 90)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 6)
                    }, label: {
                        Text("6")
                            .font(.title)
                            .frame(width:90, height: 90)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 7)
                    }, label: {
                        Text("7")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width:90, height: 90)                        .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(turn >= 3 ? Color.red : Color.green, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(turn >= 3 ? Color.red.cornerRadius(50) : Color.green.cornerRadius(50))
                    })
                }
                HStack{
                    Button(action: {
                        addValue(value: 8)
                    }, label: {
                        Text("8")
                            .font(.title)
                            .frame(width:90, height: 90)                        .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 9)
                    }, label: {
                        Text("9")
                            .font(.title)
                            .frame(width:90, height: 90)                        .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 10)
                    }, label: {
                        Text("10")
                            .font(.title)
                            .font(.title)
                            .frame(width:90, height: 90)                        .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })

                }
                HStack {
                    Button(action: {
                        addValue(value: 11)
                    }, label: {
                        Text("11")
                            .font(.title)
                            .frame(width:90, height: 90)                        .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        addValue(value: 12)
                    }, label: {
                        Text("12")
                            .font(.title)
                            .frame(width:90, height: 90)                        .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .padding(.bottom, 1)
                            .background(Color.secondary.opacity(0.4).cornerRadius(50))
                    })
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.3)) {
                            isPressed.toggle() // Trigger the scale effect
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isPressed.toggle() // Reset the scale after a short delay
                        }
                        
                        doublePoints() // Your action
                    }) {
                        Text("X2")
                            .font(.title)
                            .foregroundColor(turn >= 3 ? Color.white : Color.secondary)
                            .frame(width:90, height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(turn >= 3 ? Color.primary : Color.secondary, lineWidth: 0)
                            )
                            .padding(.horizontal, 1)
                            .background(turn >= 3 ? Color.orange.cornerRadius(50) : Color.secondary.opacity(0.2).cornerRadius(50))
                    }
                    .scaleEffect(isPressed ? 1.1 : 1.0)
                }
        }//.border(Color.black, width: 1)
    }
    
    func addValue(value: Int) {
        if turn < 3 && value == 7 {
            roundPoints += 70
            incrementTurn()
        }
        else if value == 7 {
            resetRound()
        }
        else {
            roundPoints += value
            incrementTurn()
        }
        
        handleRollingUser()
    }
    
    func doublePoints() {
        if turn >= 3 {
            roundPoints *= 2
            incrementTurn()
        }
        
        handleRollingUser()
    }
    
    func incrementTurn() {
        self.turn += 1
    }
    
    func resetRound() {
        self.turn = 0
        roundPoints = 0
        round += 1
        
        // Reset all players to active
        for player in players {
            player.resetStatus()
        }
    }
    
    func handleRollingUser() {
        rollingUserIndex += 1
        
        if rollingUserIndex >= players.count {
            rollingUserIndex = 0
        }
    }
    
}

#Preview {
    CalculatorView(roundPoints: .constant(0), round: .constant(1), players: .constant([Player]()))
}

#Preview {
    CalculatorView(roundPoints: .constant(0), round: .constant(1), players: .constant(Player.samples))
}

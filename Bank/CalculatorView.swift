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
    @State private var isPressed = false // Tracks whether the button is pressed


    
    
    var body: some View {
        
//        Text("Round: \(round)")
//        Text("\(roundPoints)")
        VStack{
            HStack{
                Button(action: {
                    addValue(value: 2)
                }, label: {
                    Text("2")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 3)
                }, label: {
                    Text("3")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 4)
                }, label: {
                    Text("4")
                        .padding(.horizontal)
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 5)
                }, label: {
                    Text("5")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
            }
            HStack{
                Button(action: {
                    addValue(value: 6)
                }, label: {
                    Text("6")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 7)
                }, label: {
                    Text("7")
                        .font(.title)
                        .foregroundColor(turn >= 3 ? Color.red : Color.green)
                        .frame(width: 75.0, height: 75.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(turn >= 3 ? Color.red : Color.green, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 8)
                }, label: {
                    Text("8")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 9)
                }, label: {
                    Text("9")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
            }
            HStack{
                Button(action: {
                    addValue(value: 10)
                }, label: {
                    Text("10")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 11)
                }, label: {
                    Text("11")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
                })
                Button(action: {
                    addValue(value: 12)
                }, label: {
                    Text("12")
                        .font(.title)
                        .frame(width: 75.0, height: 75.0)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 2)
                        )
                        .padding(.horizontal, 4)
                        .padding(.bottom)
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
                                .foregroundColor(turn >= 3 ? Color.orange : Color.gray)
                                .frame(width: 75.0, height: 75.0) // Fixed size
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(turn >= 3 ? Color.orange : Color.gray, lineWidth: 2)
                                )
                                .padding(.horizontal, 4)
                                .padding(.bottom)
                        }
                        .scaleEffect(isPressed ? 1.2 : 1.0)
    
                
            }
//            Button(action: {}, label: {
//                Text("Bank!")
//                    .foregroundColor(Color.black)
//                    .frame(width: 306.0, height: 60.0)
//                    .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
//            })
            
        }
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
    }
    
    func doublePoints() {
        if turn >= 3 {
            roundPoints *= 2
            incrementTurn()
        }
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
    
}

#Preview {
    CalculatorView(roundPoints: .constant(0), round: .constant(1), players: .constant([Player]()))
}

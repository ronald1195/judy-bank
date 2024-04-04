//
//  CalculatorView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/19/24.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var roundPoints: Int
//    @Binding var reset: Bool
    @State var turn = 0
    @Binding var round: Int
    
    
    var body: some View {
        
//        Text("Round: \(round)")
//        Text("\(roundPoints)")
        VStack{
            HStack{
                Button(action: {
                    addValue(value: 2)
                }, label: {
                    Text("2")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        
                })
                Button(action: {
                    addValue(value: 3)
                }, label: {
                    Text("3")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 4)
                }, label: {
                    Text("4")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 5)
                }, label: {
                    Text("5")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
            }
            HStack{
                Button(action: {
                    addValue(value: 6)
                }, label: {
                    Text("6")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 7)
                }, label: {
                    Text("7")
                        .foregroundColor(turn >= 3 ? Color.red : Color.green)
                        .frame(width: 70.0, height: 70.0)
                        .border(turn >= 3 ? Color.red : Color.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 8)
                }, label: {
                    Text("8")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 9)
                }, label: {
                    Text("9")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
            }
            HStack{
                Button(action: {
                    addValue(value: 10)
                }, label: {
                    Text("10")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 11)
                }, label: {
                    Text("11")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    addValue(value: 12)
                }, label: {
                    Text("12")
                        .foregroundColor(Color.black)
                        .frame(width: 70.0, height: 70.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    doublePoints()
                }, label: {
                    Text("Doubles")
                        .foregroundColor(turn >= 3 ? Color.black : Color.gray)
                        .frame(width: 70.0, height: 70.0)
                        .border(turn >= 3 ? Color.black : Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                })
                
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
    }
    
}

#Preview {
    CalculatorView(roundPoints: .constant(0), round: .constant(1))
}

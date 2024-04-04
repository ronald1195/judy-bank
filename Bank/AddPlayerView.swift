//
//  AddPlayerView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/25/24.
//

import SwiftUI

struct AddPlayerView: View {
    @Binding var newPlayer: [Player]
    @State private var username: String = ""
    @State private var closeView = false
    @State var name = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 70)
            HStack{
                Button(action: {complete()}, label: {
                                Text("Complete")
                            })
                Spacer()
                Button(action: {addPlayer()}, label: {
                                Text("Add more")
                            })
            }
            .padding(.horizontal, 70)

        }
    }
    
    func addPlayer() {
        newPlayer.append(.init(name: username, points: 0))
        username = ""
    }
   
    func complete() {
        if !username.isEmpty {
            addPlayer()
        }
        dismiss()
    }

    
}

#Preview {
    AddPlayerView(newPlayer: .constant([Player]()))
}

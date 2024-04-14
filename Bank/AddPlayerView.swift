//
//  AddPlayerView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/25/24.
//

import SwiftUI

struct AddPlayerView: View {
    @Binding var newPlayer: [Player]
    @State var displayPlayerNames = []
    @State private var username: String = ""
    @State private var closeView = false
    @State var name = ""
    @Environment(\.dismiss) var dismiss
    @State private var popupMessageTextShowing = false
    @State private var popupNameText = ""
    
    var body: some View {
        VStack {
            Text((popupMessageTextShowing ? "\(popupNameText) added to the game" : ""))
        }
        VStack{
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 70)
                .padding(.vertical, 20)
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
            .buttonStyle(.bordered)
        }
    }
    
    func addPlayer() {
        popupNameText = username
        newPlayer.append(.init(name: username, points: 0))
        self.displayPlayerNames.append(username)
        displayActionMessage()
        username = ""
    }
   
    func complete() {
        if !username.isEmpty {
            addPlayer()
        }
        dismiss()
    }
    
    func displayActionMessage(){
        self.popupMessageTextShowing.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.popupMessageTextShowing.toggle()
        }
    }

    
}

#Preview {
    AddPlayerView(newPlayer: .constant([Player]()))
}

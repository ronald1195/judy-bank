//
//  PlayerRowView.swift
//  Bank
//
//  Created by Ronald Muñoz on 3/28/24.
//

import SwiftUI

struct PlayerRowView: View {
    var player: Player
    
    var body: some View {
        HStack {
            Text(player.name)
                .foregroundColor(.primary)
                .font(.title2)
            Spacer()
            Text("$ \(player.points)")
                .font(.title3)
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    PlayerRowView(player: Player.sample)
}

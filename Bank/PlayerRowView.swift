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
                .font(.headline)
            Spacer()
            Text("$ \(player.points)")
        }
        .padding(.horizontal)
    }
}

#Preview {
    PlayerRowView(player: Player.sample)
}

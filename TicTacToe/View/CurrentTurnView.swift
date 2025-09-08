//
//  CurrentTurnView.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct CurrentTurnView: View {
    
    @Binding var player: Player
    
    var body: some View {
        HStack {
            Text("\(player.name)'s turn")
                .font(.title3)
                .fontWeight(.heavy)
                .fontDesign(.monospaced)
                .foregroundStyle(.yellow)
                .padding()
        }
    }
}

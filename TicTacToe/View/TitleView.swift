//
//  TitleView.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack(spacing: 20) {
            
            Text("Tic")
                .foregroundStyle(.red)
            
            Text("Tac")
                .foregroundStyle(.orange)
            
            Text("Toe")
                .foregroundStyle(.green)
            
        }
        .font(.largeTitle)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .foregroundStyle(.red)
        .padding()
    }
}

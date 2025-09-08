//
//  ContentView.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct GamePlayView: View {
    
    @StateObject var viewModel = GamePlayViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                TitleView()
                Spacer()
                CurrentTurnView(player: $viewModel.currentPlayer)
                GameBoard(items: $viewModel.items, itemSelectAction: viewModel.addPlayerToItem)
                Spacer()
            }
        }
        .alert("That square is already taken",
               isPresented: $viewModel.isShowingAlreadySelectedAlert,
               actions: {},
               message: { Text("Try selecting another square!") })
        .alert("Game Over!",
               isPresented: $viewModel.isShowingGameOverAlert,
               actions: { Button("OK") { viewModel.restart() } },
               message: { Text(viewModel.result?.message ?? "")})
    }
}

#Preview {
    GamePlayView()
}

//
//  ContentView.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
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
                
                Spacer()
                
                HStack {
                    Text("\(viewModel.currentPlayer.name)'s turn")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.yellow)
                        .padding()
                }
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(viewModel.items, id: \.self) { (item: Item) -> GridCellView in
                        GridCellView(color: item.color,
                                     imageName: item.player?.systemImageName,
                                     isSelected: item.player != nil,
                                     action: { viewModel.addPlayerToItem(item) })
                    }
                }
                .padding()
                .aspectRatio(1.0, contentMode: .fit)
                
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

struct GridCellView: View {
    
    let color: Color
    let imageName: String?
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        ZStack {
            color
                .aspectRatio(1.0, contentMode: .fit)
            
            if isSelected, let imageName {
                Image(systemName: imageName)
                    .resizable()
                    .padding()
                    .foregroundStyle(.white)
            }
        }
        .onTapGesture(perform: action)
        
    }
}

#Preview {
    ContentView()
}

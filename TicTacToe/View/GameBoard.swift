//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct GameBoard: View {
    
    @Binding var items: [Item]
    let itemSelectAction: (Item) -> Void
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(items, id: \.self) { (item: Item) -> GridCellView in
                GridCellView(color: item.color,
                             imageName: item.player?.systemImageName,
                             isSelected: item.player != nil,
                             action: { itemSelectAction(item) })
            }
        }
        .padding()
        .aspectRatio(1.0, contentMode: .fit)
    }
}

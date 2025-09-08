//
//  Item.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct Item: Equatable, Hashable {
    let index: Int
    let color: Color
    let player: Player?
    
    func addPlayer(_ player: Player) -> Item {
        Item(index: index, color: color, player: player)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.index == rhs.index
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
}

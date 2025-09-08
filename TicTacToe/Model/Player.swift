//
//  Player.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

struct Player: Equatable, Hashable {
    let name: String
    let systemImageName: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
}


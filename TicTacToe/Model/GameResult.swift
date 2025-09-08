//
//  GameResult.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

enum GameResult {
    case player1Won
    case player2Won
    case draw
    
    var message: String {
        switch self {
        case .player1Won:
            "Player 1 Won!"
        case .player2Won:
            "Player 2 Won!"
        case .draw:
            "Draw!"
        }
    }
}

//
//  ViewModel.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

final class GamePlayViewModel: ObservableObject {
    
    @Published var isShowingAlreadySelectedAlert = false
    @Published var isShowingGameOverAlert = false
    @Published var items: [Item]
    @Published var currentPlayer: Player
    
    var winner: Player?
    var result: GameResult?
    
    let player1 = Player(name: "Player 1", systemImageName: "circle")
    let player2 = Player(name: "Player 2", systemImageName: "xmark")
    
    init() {
        self.items = GamePlayViewModel.getInitialItems()
        self.currentPlayer = player1
    }
    
    func addPlayerToItem(_ item: Item) {
        guard item.player == nil else {
            isShowingAlreadySelectedAlert = true
            return
        }
        
        updateItems(at: item.index, item: item.addPlayer(currentPlayer))
        
        if isGameOver()  {
            setGameResult()
            isShowingGameOverAlert = true
        } else {
            switchPlayer()
        }
    }
    
    func restart() {
        items = GamePlayViewModel.getInitialItems()
        winner = nil
        result = nil
        currentPlayer = player1
    }
    
    private static func getInitialItems() -> [Item] {
        Array(0..<9).map { index in
            Item(index: index, color: GamePlayViewModel.getColorForIndex(index), player: nil)
        }
    }

    private static func getColorForIndex(_ index: Int) -> Color {
        switch index {
        case 0..<3: return .red
        case 3..<6: return .orange
        case 6..<9: return .green
        default: return .clear
        }
    }
    
    private func updateItems(at index: Int, item: Item) {
        items[index] = item
    }
    
    private func isGameOver() -> Bool {
        let winnerExists = hasWinner()
        if winnerExists {
            return true
        }
        
        let isAllSelected = items.allSatisfy { $0.player !=  nil }
        if isAllSelected {
            return true
        }
        
        return false
        
    }
    
    private func switchPlayer() {
        currentPlayer = currentPlayer == player1 ? player2 : player1
    }
    
    private func showWinner() {
        hasWinner()
        setGameResult()
        isShowingGameOverAlert = true
    }
    
    @discardableResult
    private func hasWinner() -> Bool {
        self.winner = WinnerValidator(items: items).findWinner()
        return self.winner != nil
    }
    
    private func setGameResult() {
        if winner == nil {
             result = GameResult.draw
        } else {
            result = winner == player1 ? .player1Won : .player2Won
        }
    }
}

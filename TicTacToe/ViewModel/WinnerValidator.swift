//
//  WinnerValidator.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

struct WinnerValidator {
    let items: [Item]
    
    private let rows = [[1,2,3], [4,5,6], [7,8,9]]
    private let columns = [[1,4,7], [2,5,8], [3,6,9]]
    private let diagonals = [[1,5,9], [3,5,7]]
    
    func findWinner() -> Player? {
        
        if let player = searchIndices(indices: rows) {
            return player
        }
        
        if let player = searchIndices(indices: columns) {
            return player
        }
        
        if let player = searchIndices(indices: diagonals) {
            return player
        }
        
        return nil
    }
    
    func searchIndices(indices: [[Int]]) -> Player?  {
        for indice in indices {
            let targetItems = indice.map { items[$0 - 1] }
            let playersInTargetItems = targetItems.map(\.player)
            
            let allEqual = Set(playersInTargetItems).count == 1
            
            if allEqual {
                return playersInTargetItems.first!
            }
        }
        
        return nil
    }
}


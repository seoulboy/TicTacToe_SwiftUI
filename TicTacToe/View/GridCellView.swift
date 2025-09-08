//
//  GridCellView.swift
//  TicTacToe
//
//  Created by Imho Jang on 9/8/25.
//

import SwiftUI

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


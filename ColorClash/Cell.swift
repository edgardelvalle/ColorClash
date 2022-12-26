//
//  Cell.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct Cell: View {
    @EnvironmentObject var cb: ColorBoard
    let colorCell: ColorCell
    var cellSize: CGFloat {
        if cb.size == 2 { return 160 }
        if cb.size == 3 { return 120 }
        return 90
    }
    
    var body: some View {
        Circle()
            .fill(colorCell.color)
            .frame(width: cellSize, height: cellSize)
            .onTapGesture {
                cb.score(isWinner: colorCell.winner)
            }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(colorCell: ColorCell(color: Color.red)).environmentObject(ColorBoard(size: 3))
    }
}

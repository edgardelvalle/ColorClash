//
//  BoardGrid.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct BoardGrid: View {
    @StateObject var cb: ColorBoard
    
    var body: some View {
        VStack {
            ForEach(0..<cb.size, id: \.self) { row in
                HStack{
                    ForEach(0..<cb.size, id: \.self) { col in
                        Cell(colorCell: cb.colorCells[row][col])
                    }
                }
            }
        }
    }
}

struct BoardGrid_Previews: PreviewProvider {
    static var previews: some View {
        BoardGrid(cb: ColorBoard(size: 3))
    }
}

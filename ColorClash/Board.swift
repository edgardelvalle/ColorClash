//
//  Board.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct Board: View {
    @StateObject var cb: ColorBoard
    
    var body: some View {
        ZStack {
            background
            VStack{
                highestScore
                currentScore
                TimerView()
                Spacer()
                BoardGrid(cb: cb)
                Spacer()
            }
        }.environmentObject(cb)
    }
}

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board(cb: ColorBoard(size: 3))
    }
}

extension Board {
    private var background: some View {
        Color(red: cb.backgroundColor["Red"]!, green: cb.backgroundColor["Green"]!, blue: cb.backgroundColor["Blue"]!).ignoresSafeArea()
    }
    
    private var highestScore: some View {
        HStack {
            Lives(lives: $cb.livesRemaining)
            Spacer()
            VStack {
                Text("Highest Score")
                    .foregroundColor(.white)
                HighestScore(score: cb.highestScore)
            }
        }
        .padding(.horizontal)
    }
    
    private var currentScore: some View {
        Text("\(cb.score)").foregroundColor(.white).font(.system(size: 109.66, design: .monospaced)).bold()
    }
}

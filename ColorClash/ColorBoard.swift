//
//  ColorBoard.swift
//  ColorClash
//
//  Created by Edgar Del Valle on 12/28/22.
//

import Foundation
import SwiftUI

struct ColorCell {
    var winner: Bool = false
    var color: Color
}

class ColorBoard: ObservableObject {
    private let impactSm = UIImpactFeedbackGenerator(style: .soft)
    let defaults = UserDefaults.standard
    var size: Int
    var winnerColor: [String:Double] = ["Red": 1, "Green": 1, "Blue": 1]
    var boardColor: [String:Double] = ["Red": 1, "Green": 1, "Blue": 1]
    
    
    @Published var livesRemaining = 3
    @Published var timeRemaining = 3
    @Published var colorCells: [[ColorCell]] = [[]]
    @Published var score = 0
    @Published var highestScore = 0
    @Published var backgroundColor: [String:Double] = ["Red": 1, "Green": 1, "Blue": 1]
    
    
    init(size: Int) {
        self.size = size
        highestScore = defaults.integer(forKey: "HighestScore\(self.size)")
        setupBoardColors()
    }
    
    public func setupBoardColors() {
        randomizeColor()
        generateWinner()
        generateBackgroundColor()
        fillBoard()
    }
    
    public func score(isWinner: Bool){
        if isWinner {
            impactSm.impactOccurred()
            incrementScore()
        } else if (livesRemaining > 0) {
            livesRemaining -= 1
        } else {
            livesRemaining = 3
            score = 0
        }
        timeRemaining = 3
        setupBoardColors()
    }
    
    private func incrementScore(){
        score += 1
        if (score >= highestScore) {
            highestScore = score
            defaults.set(highestScore, forKey: "HighestScore\(self.size)")
        }
    }
    
    private func fillBoard(){
        colorCells = Array(repeating: Array(repeating: ColorCell(color: Color(red: boardColor["Red"]!, green: boardColor["Green"]!, blue: boardColor["Blue"]!)), count: size), count: size)
        
        let randomRow = Int.random(in: 0..<size)
        let randomCol = Int.random(in: 0..<size)
        
        colorCells[randomRow][randomCol].winner = true
        colorCells[randomRow][randomCol].color = Color(red: winnerColor["Red"]!, green: winnerColor["Green"]!, blue: winnerColor["Blue"]!)
    }
    
    private func randomizeColor(){
        boardColor["Red"] = Double.random(in: 0...1)
        boardColor["Green"] = Double.random(in: 0...1)
        boardColor["Blue"] = Double.random(in: 0...1)
    }
    
    private func generateWinner() {
        winnerColor = boardColor
        let randomColor = ["Red", "Green", "Blue"].randomElement()!
        
        var randomDelta: Double {
            switch(score){
            case 0...10:
                return Double.random(in: 0.5...1)
            case 11...20:
                return Double.random(in: 0.4...0.9)
            case 21...30:
                return Double.random(in: 0.3...0.8)
            case 31...40:
                return Double.random(in: 0.2...0.7)
            case 41...50:
                return Double.random(in: 0.1...0.6)
            case 51...60:
                return Double.random(in: 0.09...0.5)
            case 61...70:
                return Double.random(in: 0.08...0.4)
            case 71...80:
                return Double.random(in: 0.07...0.3)
            case 81...90:
                return Double.random(in: 0.06...0.2)
            case 91...100:
                return Double.random(in: 0.05...0.1)
            default:
                return Double.random(in: 0.04...0.09)
                
            }
        }
        winnerColor[randomColor]! += randomDelta
    }
    
    private func generateBackgroundColor(){
        backgroundColor = boardColor
        let randomColor = ["Red", "Green", "Blue"].randomElement()!
        backgroundColor[randomColor]! += Double.random(in: 0.3...0.5)
    }
}

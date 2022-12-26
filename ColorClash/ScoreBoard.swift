//
//  Score.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import Foundation

struct ScoreBoard {
    static var highestScore2 = UserDefaults.standard.integer(forKey: "HighestScore2")
    static var highestScore3 = UserDefaults.standard.integer(forKey: "HighestScore3")
    static var highestScore4 = UserDefaults.standard.integer(forKey: "HighestScore4")
    
    func setHighSore(score: Int, for board: String){
        UserDefaults.standard.set(score, forKey: "HighestScore\(board)")
    }
    
    func resetScore2(){
        UserDefaults.standard.set(0, forKey: "HighestScore2")
    }
    func resetScore3(){
        UserDefaults.standard.set(0, forKey: "HighestScore3")
    }
    func resetScore4(){
        UserDefaults.standard.set(0, forKey: "HighestScore4")
    }
}

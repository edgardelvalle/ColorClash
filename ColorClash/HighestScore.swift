//
//  HighestScore.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct HighestScore: View {
    var score: Int
    
    var body: some View{
        Text("\(score)")
            .foregroundColor(.white)
            .font(.system(size: 32))
            .cornerRadius(52)
    }
}

struct HighestScore_Previews: PreviewProvider {
    static var previews: some View {
        HighestScore(score: 10)
    }
}

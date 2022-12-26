//
//  BoardSelector.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct BoardSelector: View {
    @State var score: Int = 0
    var size: Int
    var bgColor: Color
    
    var body: some View {
        ZStack {
            Text("\(size)")
                .frame(width: 174, height: 174)
                .foregroundColor(.white)
                .font(.system(size: 64, weight: .black, design: .rounded))
                .background(bgColor)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 3, x: 2, y: 2)
            HighestScore(score: score)
                .frame(width: 50, height: 50)
                .background(Color.theme.yellow)
                .cornerRadius(50)
                .offset(x: 80, y: -80)
                .onAppear{
                    score = UserDefaults.standard.integer(forKey: "HighestScore\(size)")
                }
        }
        .padding(.bottom)
    }
}

struct BoardSelector_Previews: PreviewProvider {
    static var previews: some View {
        BoardSelector(size: 3, bgColor: .red)
    }
}

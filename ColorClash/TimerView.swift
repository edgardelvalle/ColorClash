//
//  Timer.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/19/23.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var cb: ColorBoard
    let timer = Timer.publish(every: 1.0, on: .current, in: .common).autoconnect()
    
    // Countdown
    @State var finishedText: String? = nil
    
    var body: some View {
        HStack {
            ForEach(1...3, id: \.self) { index in
                Circle()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.white)
                    .font(.title)
                    .opacity(cb.timeRemaining < index ? 0.5 : 1)
            }
        }
        .onReceive(timer) { _ in
            if cb.timeRemaining <= 1 {
                cb.score(isWinner: false)
                cb.timeRemaining = 3
            } else {
                cb.timeRemaining -= 1
            }
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(ColorBoard(size: 3))
    }
}

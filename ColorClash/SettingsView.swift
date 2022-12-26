//
//  SettingsView.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            Color.theme.backgroundColor.ignoresSafeArea()
            VStack(spacing: 40) {
                Button {
                    ScoreBoard().resetScore2()
                } label: {
                    Text("Reset 2x2").settingsButtonStyle()
                }
                Button {
                    ScoreBoard().resetScore3()
                } label: {
                    Text("Reset 3x3").settingsButtonStyle()
                }
                Button {
                    ScoreBoard().resetScore4()
                } label: {
                    Text("Reset 4x4").settingsButtonStyle()
                }

            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

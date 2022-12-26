//
//  SettingsButtonModifier.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct SettingsButton: ViewModifier {
    func body(content: Content) -> some View {
        content.padding(9.89).background(.white).foregroundColor(.gray).font(.system(size: 25.89)).cornerRadius(10).shadow(color: .gray, radius: 0, x: 2, y: 2)
    }
}

extension View {
    func settingsButtonStyle() -> some View {
        modifier(SettingsButton())
    }
}

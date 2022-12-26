//
//  Color.swift
//  ColorClash
//
//  Created by Edgar Del Valle on 1/5/23.
//

import Foundation
import SwiftUI


struct Theme {
    let backgroundColor = Color("BackgroundColor")
    let yellow = Color("Yellow")
    let blue = Color("Blue")
    let pink = Color("Pink")
}

extension Color {
    static let theme = Theme()
}

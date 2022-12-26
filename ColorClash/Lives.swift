//
//  Lives.swift
//  Color Clash
//
//  Created by Edgar Del Valle on 1/11/23.
//

import SwiftUI

struct Lives: View {
    @Binding var lives: Int

    var body: some View {
        HStack {
            ForEach(1...3, id: \.self) { index in
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
                    .font(.title)
                    .opacity(index > lives ? 0.1 : 0.5)
            }
        }
    }
}

struct Lives_Previews: PreviewProvider {
    static var previews: some View {
        Lives(lives: .constant(3))
    }
}

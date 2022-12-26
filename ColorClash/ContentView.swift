//
//  ContentView.swift
//  ColorClash
//
//  Created by Edgar Del Valle on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.theme.backgroundColor.ignoresSafeArea()
                VStack(spacing: 10){
                    header
                    NavigationLink {
                        Board(cb: ColorBoard(size: 2))
                    } label: {
                        BoardSelector(size: 2, bgColor: Color.theme.blue)
                    }
                    NavigationLink {
                        Board(cb: ColorBoard(size: 3))
                    } label: {
                        BoardSelector(size: 3, bgColor: Color.theme.yellow)
                    }
                    NavigationLink {
                        Board(cb: ColorBoard(size: 4))
                    } label: {
                        BoardSelector(size: 4, bgColor: Color.theme.pink)
                    }
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding(10)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                    }
                }
            }
        }.tint(.white)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var header: some View {
        Text("Select a Level")
            .foregroundColor(.white)
            .font(.system(size: 48))
            .padding(.bottom)
    }
}

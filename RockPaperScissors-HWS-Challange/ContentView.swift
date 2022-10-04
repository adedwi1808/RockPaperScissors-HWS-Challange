//
//  ContentView.swift
//  RockPaperScissors-HWS-Challange
//
//  Created by Ade Dwi Prayitno on 04/10/22.
//

import SwiftUI

struct ContentView: View {
    private var moves: [String] = ["✋🏻", "✌🏻", "👊🏻"]
    @State private var computerRandomMove: Int = Int.random(in: 0..<3)
    @State private var shouldWin: Bool = Bool.random()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

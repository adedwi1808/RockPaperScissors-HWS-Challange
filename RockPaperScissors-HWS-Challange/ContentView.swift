//
//  ContentView.swift
//  RockPaperScissors-HWS-Challange
//
//  Created by Ade Dwi Prayitno on 04/10/22.
//

import SwiftUI

struct ContentView: View {
    private var moves: [String] = ["✋🏻", "✌🏻", "👊🏻"]
    private var expectedAnswer: String = ""
    @State private var computerRandomMove: Int = Int.random(in: 0..<3)
    @State private var shouldWin: Bool = Bool.random()
    @State private var userScore: Int = 0
    @State private var questionCount: Int = 0
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Gerakan Komputer")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(moves[computerRandomMove])
                    .font(.system(size: 180))
                
            
                if shouldWin {
                    Text("Pilihlah gerakan agar menang")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                } else {
                    Text("Pilihlah gerakan agar kalah")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                }
                
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button {
                            answerButtonPressed(move)
                        } label: {
                            Text(move)
                                .font(.system(size: 60))
                        }
                    }
                }
                
                Spacer()
                
                Text("Score : \(userScore)")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
    }
    
    func answerButtonPressed(_ userAnswer: String) {
        let winningMove: [String] = ["✌🏻", "👊🏻", "✋🏻"]
        var userWin: Bool = false
        if shouldWin {
            userWin = userAnswer == winningMove[computerRandomMove] ? true : false
        } else {
            userWin = userAnswer == winningMove[computerRandomMove] ? false : true
        }
        
        if userWin {
            userScore += 10
        }
        
        if questionCount == 10 {
            //
        } else {
            newMove()
        }
    }
    
    func newMove() {
        computerRandomMove = Int.random(in: 0..<3)
        shouldWin.toggle()
        questionCount += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

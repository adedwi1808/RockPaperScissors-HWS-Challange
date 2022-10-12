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
    @State private var gameFinished: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: .cyan, location: 0.1), .init(color: .mint, location: 0.9)], center: .center, startRadius: 100, endRadius: 300)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Gerakan Komputer")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(moves[computerRandomMove])
                    .font(.system(size: 180))
                
            
                if shouldWin {
                    Text("Pilihlah gerakan agar menang")
                    .font(.system(size: 23, weight: .medium))
                    .foregroundColor(.white)
                } else {
                    Text("Pilihlah gerakan agar kalah")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                }
                
                Spacer()
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button {
                            answerButtonPressed(move)
                        } label: {
                            Text(move)
                                .font(.system(size: 60))
                        }
                    }
                }.alert("Finish", isPresented: $gameFinished) {
                    Button("Play Again", action: newGame)
                } message: {
                    Text("Your Score Is \(userScore)/100")
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
        if shouldWin {
            userScore += userAnswer == winningMove[computerRandomMove] ? 10 : 0
        } else {
            userScore += userAnswer == winningMove[computerRandomMove] ? 0 : 10
        }
        
        if questionCount == 10 {
            gameFinished = true
        } else {
            newMove()
        }
    }
    
    func newGame() {
        gameFinished = false
        computerRandomMove = Int.random(in: 0..<3)
        shouldWin.toggle()
        questionCount = 0
        userScore = 0
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

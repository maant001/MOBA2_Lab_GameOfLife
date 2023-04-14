//
//  main.swift
//  MOBA2_Lab_GameOfLife
//
//  Created by Tony Mamaril on 14.04.23.
//

import Foundation


class Board {
    var boardLayout = [[Int]]()
    init(_ size: Int) {
        print("Dimension: " + String(size) + "x" + String(size))
        boardLayout = Array(repeating: Array(repeating: 0, count: size), count: size)
        for i in 0...size - 1 {
            for j in 0...size - 1 {
                boardLayout[i][j] = Int(arc4random() % 2)
            }
        }
    }
    
    func printBoard() {
        print("test")

        for i in 0...boardLayout.count-1 {
            var board = ""

            for j in 0...boardLayout[i].count-1 {
                board += String([i][j])
            }
            
            print(board)
        }
    }
    

}

let board = Board(3)
board.printBoard()
//print("initial iteration distribution ----")
//board.printBoard()
//for _ in 1..<10 {
    //board.calculateNextCircle()
    //print("next iteration distribution ----")
    //board.printBoard()
//}

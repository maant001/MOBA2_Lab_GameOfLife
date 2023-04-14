//
//  main.swift
//  MOBA2_Lab_GameOfLife
//
//  Created by Tony Mamaril on 14.04.23.
//

import Foundation


class Board {
    var boardLayout: [[Int]]
    init(_ size: Int) {
        print("Dimension: " + String(size) + "x" + String(size))
        boardLayout = Array(repeating: Array(repeating: 0, count: size), count: size)
        for i in 0...size-1 {
            for j in 0...size-1 {
                boardLayout[i][j] = Int(arc4random() % 2)
            }
        }
    }
    
    func printBoard() {
        for i in 0...boardLayout.count-1 {
            var board = ""

            for j in 0...boardLayout[i].count-1 {
                board += String(boardLayout[i][j])
            }
            
            print(board)
        }
    }
    
    func checkAliveNeighbours(_ l: Int, _ m: Int) -> Int {
        var aliveNeighbours = 0
        // checking neighbouring cells
        aliveNeighbours += checkNeighbouringCell(l - 1, m - 1)
        aliveNeighbours += checkNeighbouringCell(l - 1, m)
        aliveNeighbours += checkNeighbouringCell(l - 1, m + 1)
        aliveNeighbours += checkNeighbouringCell(l, m - 1)
        aliveNeighbours += checkNeighbouringCell(l, m + 1)
        aliveNeighbours += checkNeighbouringCell(l + 1, m - 1)
        aliveNeighbours += checkNeighbouringCell(l + 1, m)
        aliveNeighbours += checkNeighbouringCell(l + 1, m + 1)

        return aliveNeighbours
    }
    
    // _ in param list enables omitting param names on call!
    func checkNeighbouringCell(_ row: Int, _ column: Int) -> Int {
        // check board out of bounds
        if (row < 0 || column < 0) {
            return 0
        } else
        if (row >= boardLayout.count || column >= boardLayout.count) {
            return 0
        } else

        // check state of neigh cell
        if (boardLayout[row][column] == 1) {
            return 1
        } else {
            return 0
        }
    }
    
    func calculateNextGen(_ boardLayout: Array<Array<Any>>, _ rows: Int, _ columns: Int ) -> Array<Array<Any>> {
        var futureGen = [[Int]]()

        for l in 0...boardLayout.count {
            for m in 0...boardLayout.count {


                // subtracting
                //var aliveNeighbours = checkAliveNeighbours(rows, columns) - boardLayout[l][m].state
                var aliveNeighbours = checkAliveNeighbours(l, m)


                // Any live cell with fewer than two live neighbours dies, as if by underpopulation.
                if ((boardLayout[l][m] as! Int == 1) && (aliveNeighbours < 2)) {
                    futureGen[l][m] = 0
                } else

                // Any live cell with more than three live neighbours dies, as if by overpopulation.
                if ((boardLayout[l][m] as! Int == 1) && (aliveNeighbours > 3)) {
                    futureGen[l][m] = 0
                } else

                // Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
                if ((boardLayout[l][m] as! Int == 0) && (aliveNeighbours == 3)) {
                    futureGen[l][m] = 1
                } else {
                    futureGen[l][m] = boardLayout[l][m] as! Int
                }

            }
        }
        return futureGen
    }
    
    func getBoard() -> [[Int]] {
        return boardLayout
    }
    
    
   

}

// define here how many generations
let size = 7
let board = Board(size)
print("Generation 0 :)")
board.printBoard()
print("-------")

for i in 1...15 {
    board.calculateNextGen(board.getBoard(), size, size)
    print("Generation " + String(i) + " :)")
    board.printBoard()
    print("-------")

}

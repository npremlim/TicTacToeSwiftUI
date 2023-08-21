//
//  GameState.swift
//  TicTacToeSwiftUI
//
//  Created by Naomi on 16/7/23.
//

import Foundation

class GameState : ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.X
    @Published var XScore = 0
    @Published var OScore = 0
    @Published var showAlert = false
    @Published var alertmsg = "Draw"

    
    
    //when initializing game, reset board vars
    init()
    {
        resetBoard()
    }
    func turnText() ->String
    {
        return turn == Tile.X ? "X's turn" : "O's turn"
        
    }
    func checkWin() -> Bool
    {
        if (isTurnTile(0,0) && isTurnTile(1,0) && isTurnTile(2,0)  )
        {
            return true
        }
        if (isTurnTile(0,1) && isTurnTile(1,1) && isTurnTile(2,1)  )
        {
            return true
        }
        if (isTurnTile(0,2) && isTurnTile(1,2) && isTurnTile(2,2)  )
        {
            return true
        }
        
        if (isTurnTile(0,0) && isTurnTile(0,1) && isTurnTile(0,2)  )
        {
            return true
        }
        if (isTurnTile(1,0) && isTurnTile(1,1) && isTurnTile(1,2)  )
        {
            return true
        }
        if (isTurnTile(2,0) && isTurnTile(2,1) && isTurnTile(2,2)  )
        {
            return true
        }
        
        if (isTurnTile(0,0) && isTurnTile(1,1) && isTurnTile(2,2)  )
        {
            return true
        }
        if (isTurnTile(2,0) && isTurnTile(1,1) && isTurnTile(0,2)  )
        {
            return true
        }
        
       return false
        
    }
    func placeTile(_ row : Int, _ col : Int )
    {
        //if coord already is not empty reject this placement by returning
        if(board[row][col].tile != Tile.Empty)
        {
            return
        }
        
        // if turn = cross then place cross else place circle
        board[row][col].tile = turn == Tile.X ? Tile.X : Tile.O
        
        
        
        if(checkWin())
        {
            if(turn == Tile.X)
            {
                XScore+=1
            }
            else
            {
                OScore+=1
            }
            
            let winner = turn == Tile.X ? "X" : "O"
            alertmsg = winner + " Won!"
            showAlert=true
        }
        
        if(turn == Tile.X)
        {
            turn = Tile.O
        }
        else if ( turn == Tile.O)
        {
            turn = Tile.X
        }
        
        if(checkDraw())
        {
          
            alertmsg = "There was a draw!"
            showAlert=true
        }
    }
    
    func checkDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if cell.tile == Tile.Empty
                {
                    return false
                }
            }
        }
        return true
    }
    func isTurnTile (_ row : Int, _ col : Int ) -> Bool
    {
        return board[row][col].tile == turn
    }
    func resetBoard()
    {
        //for new board of 2d array with variable cell in it
        var newBoard = [[Cell]]()
        
        for _ in 0...2
        {
            var row = [Cell]()
            
            for _ in 0...2
            {
                row.append(Cell(tile:Tile.Empty))
            }
            
            newBoard.append(row)
        }
        
        board=newBoard
    }
}

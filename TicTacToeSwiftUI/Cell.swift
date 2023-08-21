
import Foundation
import UIKit
import SwiftUI
struct Cell
{
    var tile: Tile
    func displayTile()-> String
    {
        //based on value in tile (user 1 or 2) display X or O
        switch(tile)
        {
        case Tile.O:
                return "O"
        case Tile.X:
            return "X"
        default:
            return ""
        }
    }
    
    func tileColor()-> Color
    {
        //based on value in tile (user 1 or 2) display red or black font
        switch(tile)
        {
        case Tile.O:
            return Color.red
        case Tile.X:
            return Color.black
        default:
            return Color.black
        }
    }
}

//defining tile class
enum Tile
{
    case X
    case O
    case Empty
}

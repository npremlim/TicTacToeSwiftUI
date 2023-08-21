

import SwiftUI

struct ContentView: View
{
    @StateObject var gameState = GameState()
    var body: some View {
        // set border size
        let bordersize = CGFloat(5)
        
        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        
        //search what VStack is
        VStack(spacing:bordersize)
        {
            //double for loop to render board
            ForEach(0...2, id: \.self)
            {
                row in
                HStack(spacing:bordersize)
                {
                    ForEach(0...2, id: \.self)
                    {
                        column in
                        //hard code it to be X
                        let cell = gameState.board[row][column]
                        Text(cell.displayTile())
                        //setting css ?
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row,column)
                            }
                    }
                }
            }
            
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert)
        {
            Alert(
                  title: Text(gameState.alertmsg),
                  dismissButton: .default(Text("Okay"))
                  {
                gameState.resetBoard()
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

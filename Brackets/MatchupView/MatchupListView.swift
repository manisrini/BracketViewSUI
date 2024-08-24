//
//  MatchupListView.swift
//  Brackets
//
//  Created by Manikandan on 22/08/24.
//

import SwiftUI

struct MatchupListView: View {
    
    var matchups : [Matchup]
    var column : Int
    var focusedColumn : Int
    var isLastColumn : Bool
    var isFirstColumn : Bool
    let cellHeight : CGFloat = 100

    init(matchups: [Matchup], column : Int,focusedColumn : Int,isLastColumn: Bool, isFirstColumn: Bool) {
        self.matchups = matchups
        self.column = column
        self.focusedColumn = focusedColumn
        self.isLastColumn = isLastColumn
        self.isFirstColumn = isFirstColumn
    }
    
    var body: some View {
        LazyVStack(spacing : 0){
            
            ForEach(Array(self.matchups.enumerated()),id: \.element.id) { index,matchup in
                
                MatchupView(matchup: matchup,
                            isLastColumn: isLastColumn,
                            isFirstColumn: isFirstColumn,
                            heightExp: column - focusedColumn,
                            isTopMatch: isTopMatch(index),
                            isCollapsed: column < focusedColumn)
            }
        }
        
    }
    
    func isTopMatch(_ index : Int) -> Bool{
        if index % 2 == 0{
            return true
        }else{
            return false
        }
    }    
}

#Preview {
    MatchupListView(matchups: [
        Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3))
    ], column: 1, focusedColumn: 0, isLastColumn: false, isFirstColumn: false)
}

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
    var isLastColumn : Bool
    var isFirstColumn : Bool
    let cellHeight : CGFloat = 100

    init(matchups: [Matchup], column : Int,isLastColumn: Bool, isFirstColumn: Bool) {
        self.matchups = matchups
        self.column = column
        self.isLastColumn = isLastColumn
        self.isFirstColumn = isFirstColumn
    }
    
    var body: some View {
        VStack(spacing : getSpacing(column: column)){
            
            ForEach(Array(self.matchups.enumerated()),id: \.element.id) { index,matchup in
                
                MatchupView(
                    matchup: matchup,
                    isLastColumn: isLastColumn,
                    isFirstColumn: isFirstColumn,
                    showDownwards: showDownwardsLine(index),
                    lineHeight: getLineHeight(column: column)
                )
            }
        }
        .padding(.top,getColumnTopPadding(column: column))
        
    }
    
    func showDownwardsLine(_ index : Int) -> Bool{
        if index % 2 == 0{
            return true
        }else{
            return false
        }
    }
    
    func getColumnTopPadding(column : Int) -> CGFloat{
        if column == 0{
            return 0
        }
        let exponentValue = pow(2, CGFloat(column - 1))
        let topPadding = exponentValue * cellHeight/2
        return topPadding
    }
    
    func getLineHeight(column : Int) -> CGFloat{
        let exponentValue = pow(2, CGFloat(column))
        return exponentValue * cellHeight
    }
    
    func getSpacing(column : Int) -> CGFloat{
        var numberOfSpaceCells : Int = 0
        var verticalPaddingSpace : CGFloat = CGFloat(column) * 15

        if column == 0{
            return 25
        }else if column == 1{
            numberOfSpaceCells =  1
        }else if column == 2{
            numberOfSpaceCells = 2
        }
        
        let spacing = CGFloat(numberOfSpaceCells) * cellHeight
        return spacing + verticalPaddingSpace
    }
}

#Preview {
    MatchupListView(matchups: [
        Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3))
    ], column: 1, isLastColumn: false, isFirstColumn: false)
}

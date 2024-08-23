//
//  MatchupView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI

struct MatchupView: View {
    
    var matchup : Matchup
    var isLastColumn : Bool = true
    var isFirstColumn : Bool = false
    var showDownwards : Bool = false
    var lineHeight : CGFloat
    
    
    init(matchup: Matchup, isLastColumn: Bool, isFirstColumn: Bool, showDownwards: Bool,lineHeight : CGFloat) {
        self.matchup = matchup
        self.isFirstColumn = isFirstColumn
        self.isLastColumn = isLastColumn
        self.showDownwards = showDownwards
        self.lineHeight = lineHeight
    }
    
    var body: some View {
            
        HStack(spacing : 0){
            
            if !isFirstColumn{
                SleepingLine()
            }
            
            VStack(alignment: .leading) {
                
                HStack{
                    Text(matchup.date)
                    Spacer()
                    Text("FT")
                }
                
                ScoreView(team: matchup.team1)
                
                ScoreView(team: matchup.team2)

            }
            .frame(width: 250,height: 100)
            .padding()
            .cornerRadiusStyle()
            
            
            if !isLastColumn{
                SleepingLine()
                
                VStack{
                    if showDownwards{
                        StandingLine(height: lineHeight)
                            .offset(y : lineHeight/2)
                    }else{
                        StandingLine(height: lineHeight)
                            .offset(y : -lineHeight/2)
                    }

                }
            }
        }
    }
}
#Preview {
    MatchupView(matchup: Matchup(id: 1, team1: nil, team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),isLastColumn: false,isFirstColumn: false,showDownwards: false,lineHeight: 100)
}

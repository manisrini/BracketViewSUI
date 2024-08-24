//
//  MatchupView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI

struct MatchupView: View {
    
    var matchup : Matchup
    var isLastColumn : Bool
    var isFirstColumn : Bool
    var heightExp : Int
    var isTopMatch : Bool
    var isCollapsed : Bool
    
    init(matchup: Matchup, isLastColumn: Bool, isFirstColumn: Bool, heightExp: Int, isTopMatch: Bool, isCollapsed: Bool) {
        self.matchup = matchup
        self.isLastColumn = isLastColumn
        self.isFirstColumn = isFirstColumn
        self.heightExp = heightExp
        self.isTopMatch = isTopMatch
        self.isCollapsed = isCollapsed
    }
    
    var body: some View {
            
        HStack(spacing : 0){
            
            leftLineArea
            
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
            
            rightLineArea
        }
    }
    
    private var height : CGFloat{
        100 * pow(2, CGFloat(1))
    }
    
    private var leftLineArea : some View{
        Group{
            if !isFirstColumn{
                SleepingLine()
            }else{
                Spacer()
            }
        }
    }
    
    private var rightLineArea : some View{
        Group{
            if !isLastColumn{
                rightLine
            }else{
                Spacer()
            }
        }
    }
    
    private var rightLine : some View{
        HStack(spacing : 0){
            SleepingLine()
            
            if isTopMatch{
                topMatchVerticalLine
            }else{
                bottomMatchVerticalLine
            }
        }
    }
    
    private var topMatchVerticalLine : some View{
        VStack(spacing: 0){
            Spacer()
                .frame(height: height/2)
            Rectangle()
                .frame(width : 2,height: height/2)
            
        }
    }
    
    private var bottomMatchVerticalLine : some View{
        VStack(spacing: 0){
            Rectangle()
                .frame(width : 2,height: height/2)
            Spacer()
                .frame(height: height/2)
        }
    }

}
#Preview {
    MatchupView(matchup: Matchup(id: 1, team1: nil, team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),isLastColumn: false,isFirstColumn: false,heightExp: 1,isTopMatch: true,isCollapsed: false)
}

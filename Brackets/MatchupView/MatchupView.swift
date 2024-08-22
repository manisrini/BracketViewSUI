//
//  MatchupView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI

struct MatchupView: View {
    
    var matchup : Matchup
    var isLastCell : Bool = false
    var isFirstCell : Bool = false
    var showDownwards : Bool = false
    
    var body: some View {
            
        HStack(spacing : 0){
            VStack(alignment: .leading) {
                
                HStack{
                    Text(matchup.date)
                    Spacer()
                    Text("FT")
                }
                
                ScoreView(team: matchup.team1)
                
                ScoreView(team: matchup.team2)

            }
            .frame(width: 250)
            .padding()
            .cornerRadiusStyle()
            
            SleeplingLine()
            
            if showDownwards{
                StandingLine(height: 100)
                    .offset(y : 50)
            }else{
                StandingLine(height: 100)
                    .offset(y : -50)
            }
            
        }
    }
}
#Preview {
    MatchupView(matchup: Matchup(id: 1, team1: nil, team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)))
}

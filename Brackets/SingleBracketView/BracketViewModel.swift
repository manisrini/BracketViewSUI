//
//  BracketViewModel.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import Foundation

struct Bracket{
    let matchup1 : Matchup
    let matchup2 : Matchup
}

class BracketViewModel{
    
    let bracket : Bracket
    
    init(bracket: Bracket) {
        self.bracket = bracket
    }
    
//    func createMatchup() -> Matchup{
//        var qualifiedTeam1 : Team?
//        var qualifiedTeam2 : Team?
//        
//        
//        if let firstMatchupTeam1 = self.bracket.matchup1.team1{
//            
//        }
//        
//        if let firstMatchupTeam2 = self.bracket.matchup1.team2{
//
//        }
//        
//        if let secondMatchupTeam1 = self.bracket.matchup2.team1{
//            
//        }
//        
//        if let secondMatchupTeam2 = self.bracket.matchup2.team2{
//
//        }
//        
//
//        return Matchup(id: matchupId, team1: qualifiedTeam1, team2: qualifiedTeam2, winner: nil)
//        
//    }
}

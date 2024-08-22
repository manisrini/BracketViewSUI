//
//  TournamentBracketViewModel.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import Foundation

class TournamentBracketViewModel{
 
    var tournament : Tournament
    
    init(tournament: Tournament) {
        self.tournament = tournament
    }
    
    func getBracketsCount(_ round : Round) -> Int{
        return round.matchUps.count / 2
    }
    
    func createBracketViewModel(_ index : Int,_ round : Round) -> BracketViewModel{
        let firstMatchup = round.matchUps[index]
        let secondMatchup = round.matchUps[index + 1]
        
        return BracketViewModel(bracket:
            Bracket(
            matchup1: firstMatchup,
            matchup2: secondMatchup
            )
        )
    }
}

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
    
    func isLastColumn(_ index : Int) -> Bool{
        if index == tournament.rounds.count - 1{
            return true
        }else{
            return false
        }
    }
    
    func isFirstColumn(_ index : Int) -> Bool{
        if index == 0{
            return true
        }else{
            return false
        }
    }
    
    func showDownwardsLine(_ index : Int) -> Bool{
        if index % 2 == 0{
            return true
        }else{
            return false
        }
    }
}

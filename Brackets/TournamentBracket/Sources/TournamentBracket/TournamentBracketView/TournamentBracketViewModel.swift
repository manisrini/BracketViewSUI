//
//  TournamentBracketViewModel.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import Foundation

public class TournamentBracketViewModel{
 
    var tournament : Tournament
    
    public init(tournament: Tournament) {
        self.tournament = tournament
    }
    
    func getBracketsCount(_ round : Round) -> Int{
        return round.matchUps.count / 2
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


}

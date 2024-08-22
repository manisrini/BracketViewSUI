//
//  BracketView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI


struct BracketView: View {
    
    var viewModel : BracketViewModel
    
    init(_ viewModel: BracketViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing : 20){
            VStack(spacing: 20){
                MatchupView(matchup: viewModel.bracket.matchup1)
                MatchupView(matchup: viewModel.bracket.matchup2)
            }
            
//            MatchupView(matchup: viewModel.createMatchup())
        }
        
    }
}

#Preview {
    
    
    BracketView(BracketViewModel(bracket:  Bracket(
        matchup1: Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
        matchup2: Matchup(id: 2, team1: Team(id: 1, name: "india", image: "India", points: 2), team2: Team(id: 2, name: "argentina", image: "Argentina", points: 3)))
    )
    )
}

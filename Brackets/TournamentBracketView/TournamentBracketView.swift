//
//  TournamentBracketView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI

struct Tournament{
    let rounds : [Round]
}

struct Round {
    let id : Int
    let matchUps : [Matchup]
}


struct Matchup  {
    let id : Int
    let team1 : Team?
    let team2 : Team?
    let date : String = "29 Jun"
}
struct Team{
    let id : Int
    @Capitalised var name : String
    let image : String
    let points : Int
}


struct TournamentBracketView: View {
    
    var viewModel : TournamentBracketViewModel
    
    private let columnWidth : CGFloat = UIScreen.main.bounds.width * 0.9
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing : 25){
                ForEach(viewModel.tournament.rounds,id: \.id) { round in
                    
                    VStack(spacing : 25){
                        
                        ForEach(Array(round.matchUps.enumerated()),id: \.element.id) { index,matchUp in
                            
                            MatchupView(matchup: matchUp)
                        }
                    }.frame(width: columnWidth)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .contentMargins(15, for: .scrollContent)
    }
}

#Preview {
    TournamentBracketView(viewModel: TournamentBracketViewModel(tournament: Tournament(
        rounds: [
        Round(id: 1, matchUps: [
            Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
            Matchup(id: 2, team1: Team(id: 3, name: "india", image: "India", points: 5), team2: Team(id: 4, name: "argentina", image: "Argentina", points: 4)),
            Matchup(id: 3, team1: Team(id: 5, name: "australia", image: "England", points: 2), team2: Team(id: 6, name: "spain", image: "India", points: 3)),
            Matchup(id: 4, team1: Team(id: 7, name: "england", image: "England", points: 2), team2: Team(id: 8, name: "netherland", image: "Netherland", points: 3))
        ]),
        Round(id: 2, matchUps: [
            Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
            Matchup(id: 2, team1: Team(id: 3, name: "india", image: "India", points: 5), team2: Team(id: 2, name: "argentina", image: "Argentina", points: 4)),
            
        ]),
        Round(id: 3, matchUps: [
            Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
        ])
    ]
    )))
}

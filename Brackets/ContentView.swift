//
//  ContentView.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI
import TournamentBracket

struct ContentView: View {
    var body: some View {
        TournamentBracketView(viewModel: TournamentBracketViewModel(tournament: Tournament(
            rounds: [
                Round(id: 4, matchUps: [
                    Matchup(id: 1, team1: Team(id: 1, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id: 2, name: "netherland", image: UIImage(named: "Netherland"), points: 3)),
                    
                    Matchup(id: 2, team1: Team(id: 3, name: "india", image: UIImage(named: "India"), points: 3), team2: Team(id: 4, name: "argentina", image: UIImage(named: "Argentina"), points: 4)),
                    
                    Matchup(id: 3, team1: Team(id: 5, name: "australia", image: UIImage(named: "Australia"), points: 2), team2: Team(id: 6, name: "spain", image: UIImage(named: "Spain"), points: 3)),
                    
                    Matchup(id: 4, team1: Team(id: 7, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id: 8, name: "netherland", image: UIImage(named: "Netherland"), points: 3)),
                    
                    Matchup(id: 5, team1: Team(id: 9, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id: 10, name: "India", image: UIImage(named: "India"), points: 3)),
                    
                    Matchup(id: 6, team1: Team(id: 11, name: "india", image: UIImage(named: "India"), points: 5), team2: Team(id: 12, name: "argentina", image: UIImage(named: "Argentina"), points: 4)),
                    
                    Matchup(id: 7, team1: Team(id: 13, name: "australia", image: UIImage(named: "India"), points: 2), team2: Team(id: 14, name: "spain", image: UIImage(named: "India"), points: 3)),
                    
                    Matchup(id: 8, team1: Team(id: 15, name: "england", image: UIImage(named: "India"), points: 2), team2: Team(id: 16, name: "netherland", image: UIImage(named: "India"), points: 3))
                ]),
            Round(id: 1, matchUps: [
                Matchup(id: 44, team1: Team(id: 17, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id: 18, name: "netherland", image: UIImage(named: "Netherland"), points: 3)),
                
                Matchup(id: 43, team1: Team(id: 19, name: "india", image: UIImage(named: "India"), points: 5), team2: Team(id: 20, name: "argentina", image: UIImage(named: "Argentina"), points: 4)),
                
                Matchup(id: 34, team1: Team(id: 21, name: "australia", image: UIImage(named: "India"), points: 2), team2: Team(id: 22, name: "spain", image: UIImage(named: "India"), points: 3)),
                
                Matchup(id: 23, team1: Team(id: 23, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id:24, name: "netherland", image: UIImage(named: "Netherland"), points: 3))
            ]),
            Round(id: 2, matchUps: [
                Matchup(id: 12, team1: Team(id: 1, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id: 2, name: "netherland", image: UIImage(named: "Netherland"), points: 3)),
                
                Matchup(id: 14, team1: Team(id: 3, name: "india", image: UIImage(named: "India"), points: 5), team2: Team(id: 2, name: "argentina", image: UIImage(named: "Argentina"), points: 4)),
                
            ]),
            Round(id: 3, matchUps: [
                Matchup(id: 123, team1: Team(id: 25, name: "england", image: UIImage(named: "England"), points: 2), team2: Team(id: 26, name: "netherland", image: UIImage(named: "Netherland"), points: 3)),
            ])
        ]
        )))
    }
}

#Preview {
    ContentView()
}

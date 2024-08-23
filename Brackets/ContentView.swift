//
//  ContentView.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TournamentBracketView(viewModel: TournamentBracketViewModel(tournament: Tournament(
            rounds: [
                Round(id: 5, matchUps: [
                    Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
                    Matchup(id: 2, team1: Team(id: 3, name: "india", image: "India", points: 5), team2: Team(id: 4, name: "argentina", image: "Argentina", points: 4)),
                    Matchup(id: 3, team1: Team(id: 5, name: "australia", image: "England", points: 2), team2: Team(id: 6, name: "spain", image: "India", points: 3)),
                    Matchup(id: 4, team1: Team(id: 7, name: "england", image: "England", points: 2), team2: Team(id: 8, name: "netherland", image: "Netherland", points: 3)),
                    Matchup(id: 1, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
                    Matchup(id: 2, team1: Team(id: 3, name: "india", image: "India", points: 5), team2: Team(id: 4, name: "argentina", image: "Argentina", points: 4)),
                    Matchup(id: 3, team1: Team(id: 5, name: "australia", image: "England", points: 2), team2: Team(id: 6, name: "spain", image: "India", points: 3)),
                    Matchup(id: 4, team1: Team(id: 7, name: "england", image: "England", points: 2), team2: Team(id: 8, name: "netherland", image: "Netherland", points: 3))
                ]),
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
}

#Preview {
    ContentView()
}

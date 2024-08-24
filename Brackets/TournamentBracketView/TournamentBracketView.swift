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
    @State var focusedColumnIndex : Int = 0
    @State var offsetX : CGFloat = 0
    let columnWidth: CGFloat = UIScreen.main.bounds.width * 0.9
    
    var drag : some Gesture{
        DragGesture()
            .onChanged{value in
                offsetX = value.translation.width - CGFloat(focusedColumnIndex) * columnWidth
            }
            .onEnded(handleDragEnded)
    }
    
    var body: some View {
        
        ScrollView(.vertical){
            ScrollViewReader{ scrollViewProxy in
                ScrollView(.horizontal) {
                    HStack(alignment : .top,spacing : 0){
                        
                        ForEach(Array(viewModel.tournament.rounds.enumerated()),id: \.element.id) { column,round in
                            
                            MatchupListView(matchups: round.matchUps, column: column,isLastColumn: viewModel.isLastColumn(column), isFirstColumn: viewModel.isFirstColumn(column))
                
                        }
                    }
                    .offset(x : offsetX)
                    .animation(.easeInOut,value: offsetX)
                    .scrollTargetLayout()

                }
                .scrollDisabled(true)
                .gesture(drag)
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .contentMargins(15, for: .scrollContent)
            }

        }
        .padding(.vertical,20)
    }
            
    private func handleDragEnded(_ gestureValue : DragGesture.Value){
        let threshold: CGFloat = 80
        if gestureValue.translation.width < -threshold{
            moveToNextColumn()
        }else if gestureValue.translation.width > threshold{
            moveToPrevColumn()
        }else{
            offsetX = -CGFloat(focusedColumnIndex) * columnWidth
        }
    }
    
    private func moveToNextColumn(){
        if focusedColumnIndex < viewModel.tournament.rounds.count - 1 {
            focusedColumnIndex += 1
        }
        offsetX = -CGFloat(focusedColumnIndex) * columnWidth
    }
    
    private func moveToPrevColumn(){
        if focusedColumnIndex > 0 {
            focusedColumnIndex -= 1
        }
        offsetX = -CGFloat(focusedColumnIndex) * columnWidth

    }
}

#Preview {
    TournamentBracketView(viewModel: TournamentBracketViewModel(tournament: Tournament(
        rounds: [
            Round(id: 4, matchUps: [
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

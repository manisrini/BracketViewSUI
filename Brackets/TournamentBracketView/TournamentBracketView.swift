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
    let columnWidth: CGFloat = UIScreen.main.bounds.width * 0.9
    @State var focusedColumnIndex : Int = 0
    @State var offsetX : CGFloat = 0

    var drag : some Gesture{
        DragGesture()
            .onChanged{value in
                offsetX = value.translation.width - CGFloat(focusedColumnIndex) * columnWidth
            }
            .onEnded(handleDragEnded)
    }
    
    var body: some View {
        
        CustomTabView(selectedIndex: $focusedColumnIndex) { prevTabIndex,selectedTabIndex in
            var steps : Int = 0
            if selectedTabIndex > prevTabIndex{
                steps = selectedTabIndex - prevTabIndex
                moveToNextColumn(steps)
            }else if selectedTabIndex < prevTabIndex{
                steps = prevTabIndex - selectedTabIndex
                moveToPrevColumn(steps)
            }
        }
        
        ScrollView(.vertical){
            ScrollViewReader{ scrollViewProxy in
                ScrollView(.horizontal) {
                    HStack(alignment : .top,spacing : 0){
                        
                        ForEach(Array(viewModel.tournament.rounds.enumerated()),id: \.element.id) { column,round in
                            BracketListView(
                                matchups: round.matchUps,
                                column: column,
                                focusedColumn: focusedColumnIndex,
                                isLastColumn: viewModel.isLastColumn(column),
                                isFirstColumn: viewModel.isFirstColumn(column))
                        }
                    }
                    .offset(x : offsetX)
                    .animation(.easeInOut,value: offsetX)
                    .scrollTargetLayout()

                }
                .scrollDisabled(true)
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .contentMargins(15, for: .scrollContent)
            }

        }
        .gesture(drag)
    }
            
    private func handleDragEnded(_ gestureValue : DragGesture.Value){
        let threshold: CGFloat = 50
        if gestureValue.translation.width < -threshold{
            moveToNextColumn()
        }else if gestureValue.translation.width > threshold{
            moveToPrevColumn()
        }else{
            offsetX = -CGFloat(focusedColumnIndex) * columnWidth
        }
    }
    
    private func moveToNextColumn(_ steps : Int = 1){
        if focusedColumnIndex < viewModel.tournament.rounds.count - 1 {
            focusedColumnIndex += steps
        }
        offsetX = -CGFloat(focusedColumnIndex) * columnWidth
    }
    
    private func moveToPrevColumn(_ steps : Int = 1){
        if focusedColumnIndex > 0 {
            focusedColumnIndex -= steps
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
                Matchup(id: 5, team1: Team(id: 9, name: "england", image: "England", points: 2), team2: Team(id: 10, name: "netherland", image: "Netherland", points: 3)),
                Matchup(id: 6, team1: Team(id: 11, name: "india", image: "India", points: 5), team2: Team(id: 12, name: "argentina", image: "Argentina", points: 4)),
                Matchup(id: 7, team1: Team(id: 13, name: "australia", image: "England", points: 2), team2: Team(id: 14, name: "spain", image: "India", points: 3)),
                Matchup(id: 8, team1: Team(id: 15, name: "england", image: "England", points: 2), team2: Team(id: 16, name: "netherland", image: "Netherland", points: 3))
            ]),
        Round(id: 1, matchUps: [
            Matchup(id: 44, team1: Team(id: 17, name: "england", image: "England", points: 2), team2: Team(id: 18, name: "netherland", image: "Netherland", points: 3)),
            Matchup(id: 43, team1: Team(id: 19, name: "india", image: "India", points: 5), team2: Team(id: 20, name: "argentina", image: "Argentina", points: 4)),
            Matchup(id: 34, team1: Team(id: 21, name: "australia", image: "England", points: 2), team2: Team(id: 22, name: "spain", image: "India", points: 3)),
            Matchup(id: 23, team1: Team(id: 23, name: "england", image: "England", points: 2), team2: Team(id:24, name: "netherland", image: "Netherland", points: 3))
        ]),
        Round(id: 2, matchUps: [
            Matchup(id: 12, team1: Team(id: 1, name: "england", image: "England", points: 2), team2: Team(id: 2, name: "netherland", image: "Netherland", points: 3)),
            Matchup(id: 14, team1: Team(id: 3, name: "india", image: "India", points: 5), team2: Team(id: 2, name: "argentina", image: "Argentina", points: 4)),
            
        ]),
        Round(id: 3, matchUps: [
            Matchup(id: 123, team1: Team(id: 25, name: "england", image: "England", points: 2), team2: Team(id: 26, name: "netherland", image: "Netherland", points: 3)),
        ])
    ]
    )))
}

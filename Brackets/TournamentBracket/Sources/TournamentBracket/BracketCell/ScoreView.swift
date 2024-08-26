//
//  ScoreView.swift
//  Brackets
//
//  Created by Manikandan on 21/08/24.
//

import SwiftUI

struct ScoreView: View {
    
    var team : Team?
    
    var body: some View {
        HStack{

            if let _team = team{
                if let _imageView = _team.image{
                    Image(uiImage: _imageView)
                        .resizable()
                        .frame(width: 20,height: 20)
                        .cornerRadiusStyle(2)
                }
                
                Text(_team.name)
                    .lineLimit(1)
                Spacer()
                Text("\(_team.points)")
                    .lineLimit(1)
            }else{
                Image(systemName: "")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .cornerRadiusStyle(2)

                Text("TBD")
                    .padding(.vertical,5)
            }
        }

    }
}

#Preview {
    ScoreView()
}

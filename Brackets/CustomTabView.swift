//
//  CustomTabView.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI

struct CustomTabView: View {
    
    
    var tabs : [String] = ["Round of 16","Quarterfinal"]
    
    var body: some View {
//        ZStack{
//            Rectangle()
//                .frame(height: 60)
//                .foregroundStyle(Color(hex: "242832"))
//            
//            VStack(alignment: .leading){
//                HStack{
//                    ForEach(tabs,id: \.self) { tab in
//                        Text(tab)
//                            .foregroundStyle(Color.white)
//                    }
//                }
//            }
//        }
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<10){ index in
                    Rectangle()
                        .frame(width: 100,height: 100)
                        .overlay{
                            Text("\(index)")
                                .foregroundStyle(Color.white)
                        }
                }
            }
        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    CustomTabView()
}

//
//  CustomTabView.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI

typealias selectedTabIndex = Int
typealias prevSelectedTabIndex = Int

struct CustomTabView: View {
    
    var tabs : [String] = ["Round of 32","Round of 16","Quarters","Semis","Final"]
    @Binding var selectedIndex : Int
    var didSelectTab : ((prevSelectedTabIndex,selectedTabIndex)->())?
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(Color(hex: "242832"))
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(Array(tabs.enumerated()),id: \.element) { index,tab in
                        
                        Button {
                            self.didSelectTab?(selectedIndex,index)
                            selectedIndex = index
                        } label: {
                            VStack{
                                TabItem(tab: tab, isEqual: selectedIndex == index)
                            }
                        }
                    }
                }
                .padding(.leading,5)
            }
        }
    }
}

struct TabItem : View{
    
    var tab : String
    var isEqual : Bool
    
    var body : some View{
        Text(tab)
            .foregroundStyle(Color.white)
            .padding(.horizontal)
        
        if isEqual{
            Rectangle()
                .frame(width: 50,height: 3)
                .foregroundStyle(Color.white)
        }else{
            Rectangle()
                .frame(width: 50,height: 3)
                .foregroundStyle(Color(hex: "242832"))
        }

    }
}

#Preview {
    CustomTabView( selectedIndex: .constant(0), didSelectTab : {_,_ in
        
    })
}

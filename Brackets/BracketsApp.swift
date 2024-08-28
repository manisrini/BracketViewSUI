//
//  BracketsApp.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import SwiftUI
import DesignSystem

@main
struct BracketsApp: App {
        
    init(){
        FontHelper.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

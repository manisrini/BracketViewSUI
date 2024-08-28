//
//  File.swift
//  
//
//  Created by Manikandan on 27/08/24.
//

import Foundation
import UIKit

public enum FontError : Error{
    case failedToRegister
}

public struct FontHelper{

    public static func registerFonts(){
        Roboto.allCases.forEach { font in
            do {
                try self.registerFont(name: font.rawValue)
            }catch{
                print(error.localizedDescription)
            }
        }
        
        NerkoOne.allCases.forEach { font in
            do {
                try self.registerFont(name: font.rawValue)
            }catch{
                print(error.localizedDescription)
            }
        }
        
        Roboto_Serif.allCases.forEach { font in
            do {
                try self.registerFont(name: font.rawValue)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    private static func registerFont(name : String) throws {
        let url = Bundle.module.url(forResource: name, withExtension: "ttf")
        guard let gUrl = url,
              let gDataProvider = CGDataProvider(url: gUrl as CFURL),
              let font = CGFont(gDataProvider) else {
                throw FontError.failedToRegister
        }
        
        var error : Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}


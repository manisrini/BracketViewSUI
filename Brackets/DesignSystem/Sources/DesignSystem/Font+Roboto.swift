//
//  File.swift
//  
//
//  Created by Manikandan on 28/08/24.
//
import SwiftUI

public enum Roboto : String,CaseIterable{
    case RobotoBlack = "Roboto-Black"
    case RobotoBlackItalic = "Roboto-BlackItalic"
    case RobotoBold = "Roboto-Bold"
    case RobotoBoldItalic = "Roboto-BoldItalic"
    case RobotoItalic = "Roboto-Italic"
    case RobotoLight = "Roboto-Light"
    case RobotoLightItalic = "Roboto-LightItalic"
    case RobotoMedium = "Roboto-Medium"
    case RobotoThin = "Roboto-Thin"
    case RobotoThinItalic = "Roboto-ThinItalic"
}

extension Font{
    
    public static func Roboto(_ roboto : Roboto,size : CGFloat) -> Font{
        return Font.custom(roboto.rawValue, size: size,relativeTo: .body)
    }
}

//
//  Font+Extension.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit
import SwiftUI

extension UIFont {
    
    static func mainBold(size: CGFloat = 14) -> UIFont {
        UIFont(name: "e-Ukraine-Bold", size: size)!
    }
    
    static func mainLight(size: CGFloat = 14) -> UIFont {
        UIFont(name: "e-Ukraine-Light", size: size)!
    }
    
    static func mainMedium(size: CGFloat = 14) -> UIFont {
        UIFont(name: "e-Ukraine-Medium", size: size)!
    }
    
    static func mainRegular(size: CGFloat = 14) -> UIFont {
        UIFont(name: "e-Ukraine-Regular", size: size)!
    }
    
    static func mainThin(size: CGFloat = 14) -> UIFont {
        UIFont(name: "e-Ukraine-Thin", size: size)!
    }
    
    static func mainUltraLight(size: CGFloat = 14) -> UIFont {
        UIFont(name: "e-Ukraine-UltraLight", size: size)!
    }

}


extension Font {
    
    static func mainBold(size: CGFloat = 14) -> Font {
        Font.custom("e-Ukraine-Bold", size: size)
    }
    
    static func mainLight(size: CGFloat = 14) -> Font {
        Font.custom("e-Ukraine-Light", size: size)
    }
    
    static func mainMedium(size: CGFloat = 14) -> Font {
        Font.custom("e-Ukraine-Medium", size: size)
    }
    
    static func mainRegular(size: CGFloat = 14) -> Font {
        Font.custom("e-Ukraine-Regular", size: size)
    }
    
    static func mainThin(size: CGFloat = 14) -> Font {
        Font.custom("e-Ukraine-Thin", size: size)
    }
    
    static func mainUltraLight(size: CGFloat = 14) -> Font {
        Font.custom("e-Ukraine-UltraLight", size: size)
    }

}

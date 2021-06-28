//
//  Fonts.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/7/1400 AP.
//

import SwiftUI

extension Font {
    static func yekan(size: CGFloat = 14, weight: CustomWeight = .regular) -> Font {
        switch weight {
        case .bold:
            return self.custom("IRANYekanMobile-Bold", size: size)
            
        case .light:
            return self.custom("IRANYekanMobile-Light", size: size)
            
        default:
            return self.custom("IRANYekanMobile", size: size)
        }
    }
    
    enum CustomWeight {
        case bold
        case light
        case regular
    }
}

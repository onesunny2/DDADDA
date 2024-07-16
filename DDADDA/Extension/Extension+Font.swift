//
//  Extension+Font.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/5/24.
//

import SwiftUI

extension Font {
    static func santokkiFont(size: CGFloat) -> Font {
        return Font.custom("HSSantokki", size: size)
    }
    
    static func santokkiFont2(size: CGFloat) -> Font {
        return Font.custom("HSSanTokki2.0-Regular", size: size)
    }
    
    static var menu: Font {
        return santokkiFont2(size: 65)
    }
    
    static var bigTitle1: Font {
        return santokkiFont(size: 45)
    }
    
    static var bigTitle2: Font {
        return santokkiFont(size: 42)
    }
    
    static var badge1: Font {
        return santokkiFont2(size: 33)
    }
    
    static var badge2: Font {
        return santokkiFont2(size: 30)
    }
    
    static var subTitle: Font {
        return santokkiFont(size: 24)
    }
    
    static var itemTitle: Font {
        return santokkiFont2(size: 20)
    }
}

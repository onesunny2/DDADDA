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
    
    static var menu: Font {
        return santokkiFont(size: 65)
    }
    
    static var title1: Font {
        return santokkiFont(size: 45)
    }
    
    static var title2: Font {
        return santokkiFont(size: 42)
    }
    
    static var badge: Font {
        return santokkiFont(size: 30)
    }
    
    static var subTitle: Font {
        return santokkiFont(size: 24)
    }
    
    static var itemTitle: Font {
        return santokkiFont(size: 20)
    }  
}

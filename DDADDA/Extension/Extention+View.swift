//
//  Extention+View.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/21/24.
//

import SwiftUI

extension View {
    func stroke(style: StrokeStyle) -> some View {
        self.overlay(
            Rectangle().strokeBorder(style: style).foregroundColor(.clear)
        ).mask(self)
    }
}

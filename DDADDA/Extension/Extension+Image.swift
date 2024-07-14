//
//  Extension+View.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/15/24.
//

import SwiftUI

extension Image {
    func resizableImage(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
    }
}

//
//  Extension+UIView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/18/24.
//

import SwiftUI

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

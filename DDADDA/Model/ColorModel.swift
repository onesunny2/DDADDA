//
//  ColorModel.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/24/24.
//

import Foundation
import SwiftUI

struct ColorModel: Identifiable {
    var id = UUID()
    var color: Color
}

let selectColors: [ColorModel] = [
    ColorModel(color: .red),
    ColorModel(color: .orange),
    ColorModel(color: .yellow),
    ColorModel(color: .green),
    ColorModel(color: .mint),
    ColorModel(color: .teal),
    ColorModel(color: .blue),
    ColorModel(color: .indigo),
    ColorModel(color: .purple),
    ColorModel(color: .pink),
    ColorModel(color: .brown)
]

let offsets: [CGPoint] = [
    CGPoint(x: 130, y: 80),
    CGPoint(x: 160, y: 10),
    CGPoint(x: 140, y: -70),
    CGPoint(x: 100, y: -135),
    CGPoint(x: 30, y: -80),
    CGPoint(x: -60, y: -70),
    CGPoint(x: 20, y: -170),
    CGPoint(x: -60, y: -160),
    CGPoint(x: -130, y: -120),
    CGPoint(x: 70, y: -5),
    CGPoint(x: 40, y: 80)
]

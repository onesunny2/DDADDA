//
//  SketchList.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/22/24.
//

import Foundation
import SwiftUI

struct MenuCategory: Identifiable, Equatable, Hashable {
    let id = UUID()
    let category: String
    let name: String
    let sketchName: String
    var saveDate: String?
    var saveStamp: String?
}



@Observable
class SketchViewModel {
    var animalSketch: [MenuCategory] = [
        MenuCategory(category: "animal", name: "라쿤", sketchName: "raccon"),
        MenuCategory(category: "animal", name: "토끼", sketchName: "rabbit"),
        MenuCategory(category: "animal", name: "다람쥐", sketchName: "squirrel"),
        MenuCategory(category: "animal", name: "독수리", sketchName: "eagle"),
        MenuCategory(category: "animal", name: "개구리", sketchName: "frog")
    ]

    var insectSketch: [MenuCategory] = [
        MenuCategory(category: "insect", name: "달팽이", sketchName: "snail"),
        MenuCategory(category: "insect", name: "나비", sketchName: "butterfly"),
        MenuCategory(category: "insect", name: "무당벌레", sketchName: "ladybug"),
        MenuCategory(category: "insect", name: "장수풍뎅이", sketchName: "goldbug"),
        MenuCategory(category: "insect", name: "개미", sketchName: "ant")
    ]
    
    var currentSketchArray: [MenuCategory]?
}

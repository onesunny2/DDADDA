//
//  SketchList.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/22/24.
//

import Foundation
import SwiftUI

struct MenuCategory: Identifiable, Equatable, Hashable, Codable {
    let id = UUID()
    let category: String
    let name: String
    let sketchName: String
    var saveDate: String?
    var saveStamp: String?
}



@Observable
class SketchViewModel {
    private let animalKey = "animalSketchKey"
    private let insectKey = "insectSketchKey"
    
    // 초기화 단계에서 기본값으로 빈 배열 할당
    var animalSketch: [MenuCategory] {
        didSet {
            saveToUserDefaults(animalSketch, key: animalKey)
        }
    }
    
    var insectSketch: [MenuCategory] {
        didSet {
            saveToUserDefaults(insectSketch, key: insectKey)
        }
    }
    
    var currentSketchArray: [MenuCategory]?
    
    // 기본값으로 빈 배열을 할당하고 init에서 UserDefaults 로드
    init() {
        self.animalSketch = []
        self.insectSketch = []
        
        // UserDefaults에서 데이터 로드
        self.animalSketch = loadFromUserDefaults(key: animalKey) ?? [
            MenuCategory(category: "animal", name: "라쿤", sketchName: "raccon"),
            MenuCategory(category: "animal", name: "토끼", sketchName: "rabbit"),
            MenuCategory(category: "animal", name: "다람쥐", sketchName: "squirrel"),
            MenuCategory(category: "animal", name: "독수리", sketchName: "eagle"),
            MenuCategory(category: "animal", name: "개구리", sketchName: "frog")
        ]
        
        self.insectSketch = loadFromUserDefaults(key: insectKey) ?? [
            MenuCategory(category: "insect", name: "달팽이", sketchName: "snail"),
            MenuCategory(category: "insect", name: "나비", sketchName: "butterfly"),
            MenuCategory(category: "insect", name: "무당벌레", sketchName: "ladybug"),
            MenuCategory(category: "insect", name: "장수풍뎅이", sketchName: "goldbug"),
            MenuCategory(category: "insect", name: "개미", sketchName: "ant")
        ]
    }
    
    func addSaveData(to item: MenuCategory, saveDate: String, saveStamp: String) {
        if let index = animalSketch.firstIndex(of: item) {
            animalSketch[index].saveDate = saveDate
            animalSketch[index].saveStamp = saveStamp
        } else if let index = insectSketch.firstIndex(of: item) {
            insectSketch[index].saveDate = saveDate
            insectSketch[index].saveStamp = saveStamp
        }
    }
    
    private func saveToUserDefaults(_ data: [MenuCategory], key: String) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    private func loadFromUserDefaults(key: String) -> [MenuCategory]? {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decodedData = try? JSONDecoder().decode([MenuCategory].self, from: savedData) {
            return decodedData
        }
        return nil
    }
}

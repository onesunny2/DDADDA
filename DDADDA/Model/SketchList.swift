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
    var savedDrawingData: Data? // UIImage 대신 Data로 저장

    // UIImage로 변환하는 계산 프로퍼티
    var savedDrawing: UIImage? {
        get {
            if let data = savedDrawingData {
                return UIImage(data: data)
            }
            return nil
        }
        set {
            savedDrawingData = newValue?.pngData()
        }
    }
}

@Observable
class SketchViewModel {
    private let animalKey = "animalSketchKey"
    private let insectKey = "insectSketchKey"
    
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
    
    init() {
        self.animalSketch = []
        self.insectSketch = []
        
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
    
    func addSaveData(to item: MenuCategory, saveDate: String, saveStamp: String, savedDrawing: UIImage?) {
        if let index = animalSketch.firstIndex(of: item) {
            animalSketch[index].saveDate = saveDate
            animalSketch[index].saveStamp = saveStamp
            animalSketch[index].savedDrawingData = savedDrawing?.pngData() // UIImage를 Data로 변환하여 저장
        } else if let index = insectSketch.firstIndex(of: item) {
            insectSketch[index].saveDate = saveDate
            insectSketch[index].saveStamp = saveStamp
            insectSketch[index].savedDrawingData = savedDrawing?.pngData() // UIImage를 Data로 변환하여 저장
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

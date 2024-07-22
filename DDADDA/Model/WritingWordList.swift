//
//  WritingWordList.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/21/24.
//

import Foundation
import SwiftUI

struct WritingItem {
    let word: String
    let image: String
}

struct WritingBook {
    let name: String
    let items: [WritingItem]
}

let writingBooks: [WritingBook] = [
    WritingBook(name: "foxAndGrape", items: [WritingItem(word: "foxFont", image: "fox"), WritingItem(word: "rabbitFont", image: "rabbit")
    ]),
    
    WritingBook(name: "prince", items: [WritingItem(word: "princeFont", image: "prince"), WritingItem(word: "starFont", image: "star")
    ]),
    
    WritingBook(name: "dogDong", items: [WritingItem(word: "dogFont", image: "dog"), WritingItem(word: "flowerFont", image: "flower")
    ])
]



let foxAndGrapeWord: [String] = ["foxFont", "rabbitFont"]
let foxAndGrapeImage: [String] = ["fox", "rabbit"]


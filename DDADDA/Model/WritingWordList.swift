//
//  WritingWordList.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/21/24.
//

import Foundation
import SwiftUI

struct WritingItem: Identifiable {
    let id = UUID()
    let word: String
    let image: String
}

struct WritingBook: Identifiable {
    let id = UUID()  // Identifiable 프로토콜을 따르기 위해 id 추가
    let name: String
    let items: [WritingItem]
}

let firstBook: [WritingBook] = [
    WritingBook(name: "book1", items: [WritingItem(word: "foxFont", image: "fox"), WritingItem(word: "rabbitFont", image: "rabbit")
    ])
]

let writingBooks: [WritingBook] = [
    WritingBook(name: "book2", items: [WritingItem(word: "crayon", image: "crayon"), WritingItem(word: "eraser", image: "eraser")
    ]),
    
    WritingBook(name: "book3", items: [WritingItem(word: "foxFont", image: "fox"), WritingItem(word: "rabbitFont", image: "rabbit")
    ]),
    
    WritingBook(name: "book4", items: [WritingItem(word: "foxFont", image: "fox"), WritingItem(word: "rabbitFont", image: "rabbit")
    ]),
    
    WritingBook(name: "book5", items: [WritingItem(word: "foxFont", image: "fox"), WritingItem(word: "rabbitFont", image: "rabbit")
    ])
]


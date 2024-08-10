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
    WritingBook(name: "book1", items: [WritingItem(word: "Book1_Word01Font", image: "Book1_Word01"), WritingItem(word: "Book1_Word02Font", image: "Book1_Word02"), WritingItem(word: "Book1_Word03Font", image: "Book1_Word03")
    ])
]

let writingBooks: [WritingBook] = [
    WritingBook(name: "book2", items: [WritingItem(word: "Book2_Word01Font", image: "Book2_Word01"), WritingItem(word: "Book2_Word02Font", image: "Book2_Word02"), WritingItem(word: "Book2_Word03Font", image: "Book2_Word03")
    ]),
    
    WritingBook(name: "book3", items: [WritingItem(word: "Book3_Word01Font", image: "Book3_Word01"), WritingItem(word: "Book3_Word02Font", image: "Book3_Word02"), WritingItem(word: "Book3_Word03Font", image: "Book3_Word03")
    ]),
    
    WritingBook(name: "book4", items: [WritingItem(word: "Book4_Word01Font", image: "Book4_Word01"), WritingItem(word: "Book4_Word02Font", image: "Book4_Word02"), WritingItem(word: "Book4_Word03Font", image: "Book4_Word03")
    ]),
    
    WritingBook(name: "book5", items: [WritingItem(word: "Book5_Word01Font", image: "Book5_Word01"), WritingItem(word: "Book5_Word02Font", image: "Book5_Word02"), WritingItem(word: "Book5_Word03Font", image: "Book5_Word03")
    ])
]


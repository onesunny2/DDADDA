//
//  DateManager.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/25/24.
//

import Foundation

enum DateManager {
    // MARK: - 날짜 변환 함수
    static var todayDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter.string(from: Date())
    }
}

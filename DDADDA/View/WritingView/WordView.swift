//
//  WordView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/19/24.
//

import SwiftUI

struct WordView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(height: geo.size.height)
                
                // 창닫기, 앨범 저장하기
                
            }
        }
    }
}

#Preview {
    WordView()
}

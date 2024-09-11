//
//  SketchView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 9/11/24.
//

import SwiftUI

struct SketchView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(height: geo.size.height)
            }
        }
    }
}

#Preview {
    SketchView()
}

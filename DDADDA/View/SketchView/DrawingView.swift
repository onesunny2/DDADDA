//
//  DrawingView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/23/24.
//

import SwiftUI

struct DrawingView: View {
    @Binding var selectSketch: String
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            Image("\(selectSketch)")
        }
    }
}

//#Preview {
//    DrawingView()
//}

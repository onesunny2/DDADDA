//
//  SelectView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/4/24.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.selectBackground)
                    .resizable()
                    .frame(height: geo.size.height)
                    .aspectRatio(contentMode: .fit)
                
                ZStack {
                    selectButton(size: geo.size)
                        .padding(.bottom, 140)
                        .padding(.leading, 50)
                    
                    // fox, rabbit
                    HStack {
                        Image(.selectFox)
                            .resizableImage(width: geo.size.width * 0.35)
                            .padding(.leading, 50)
                        
                        Spacer()
                        
                        VStack {
                            Spacer()
                            Image(.selectRabbit)
                                .resizableImage(width: geo.size.width * 0.27)
                                .padding(.trailing, 223)
                                .padding(.bottom, 70)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func selectButton(size: CGSize) -> some View {
        ZStack {
            Image(.woodStick)
                .resizableImage(width: size.width * 0.028)
            
            VStack {
                Image(.drawButton)
                    .resizableImage(width: size.width * 0.27)
                
                Image(.writeButton)
                    .resizableImage(width: size.width * 0.24)
            }
        }
    }
}

#Preview {
    SelectView()
}

//
//  SelectView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/4/24.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        NavigationStack {
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
                        animals(size: geo.size)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    
    // MARK: - 표지판
    @ViewBuilder
    func selectButton(size: CGSize) -> some View {
        ZStack {
            Image(.woodStick)
                .resizableImage(width: size.width * 0.028)
            
            VStack(spacing: 50) {
                NavigationLink(destination: SketchView(), label: {
                    Image(.drawButton)
                        .resizableImage(width: size.width * 0.27)
                        .padding(.leading, 260)
                })

                NavigationLink(destination: LibraryView(), label: {
                    Image(.writeButton)
                        .resizableImage(width: size.width * 0.24)
                        .padding(.trailing, 220)
                })
            } .padding(.bottom, 330)
        }
    }
    
    // MARK: - 동물(여우, 토끼)
    @ViewBuilder
    func animals(size: CGSize) -> some View {
        HStack {
            Image(.selectFox)
                .resizableImage(width: size.width * 0.35)
                .padding(.leading, 20)
            
            Spacer()
            
            VStack {
                Spacer()
                Image(.selectRabbit)
                    .resizableImage(width: size.width * 0.27)
                    .padding(.trailing, 223)
                    .padding(.bottom, 70)
            }
        }
    }
}

#Preview {
    SelectView()
}

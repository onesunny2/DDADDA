//
//  WordView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/19/24.
//

import SwiftUI

struct WordView: View {
    
    @Binding var isSheetPresented: Bool
    @State var isWriting: Bool = true
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .frame(height: geo.size.height)
                
                // 창닫기, 앨범 저장하기
                closeShareButton(size: geo.size)
                    .padding(.top, geo.size.height * 0.055)
                
                // 여우 그림, 글쓰기 영역
                imageTextField(size: geo.size)
                
                // 펜슬킷 도구 영역
                VStack(alignment: .leading, spacing: -geo.size.height * 0.07) {
                    eraserButton(size: geo.size)
                    
                    pencilButton(size: geo.size)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
    
    // MARK: - 창 닫기, 앨범 저장하기 버튼
    @ViewBuilder
    func closeShareButton(size: CGSize) -> some View {
        VStack {
            HStack(spacing: size.width * 0.7) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.white)
                        .frame(width: size.width * 0.09, height: size.width * 0.09)
                    
                    Image(systemName: "xmark")
                        .foregroundStyle(.darkTree)
                        .bold()
                        .font(.system(size: size.width * 0.04))
                }
                .onTapGesture {
                    isSheetPresented = false
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.darkTree)
                        .frame(width: size.width * 0.09, height: size.width * 0.09)
                    
                    Image(systemName: "square.and.arrow.down")
                        .foregroundStyle(.white)
                        .font(.system(size: size.width * 0.05))
                        .padding(.bottom, size.height * 0.013)
                }
            }
            
            Spacer()
        }
    }
    
    // MARK: - 이미지, 글쓰기 영역
    @ViewBuilder
    func imageTextField(size: CGSize) -> some View {
        VStack {
            Image(.fox)
                .resizableImage(width: size.width * 0.28)
            
            ZStack(alignment: .leading) {
                Image(.canvasBackground)
                    .resizableImage(width: size.width * 0.7)
                
                HStack(spacing: size.width * 0.09) {
                    Image(.voiceIcon)
                        .padding(.bottom, 200)
                    
                    // TODO: 추후 데이터 갈아끼우기
                    Image(.foxFont)
                } .padding(.leading, size.width * 0.05)
            }
        }
    }
    
    // MARK: - 지우개 도구버튼
    @ViewBuilder
    func eraserButton(size: CGSize) -> some View {
        Image(.eraser)
            .resizableImage(width: size.width * 0.067)
            .rotationEffect(.degrees(270))
            .onTapGesture {
                // TODO: 기능추가하기
                isWriting = false
            }
    }
    
    // MARK: - 연필 도구버튼
    func pencilButton(size: CGSize) -> some View {
        Image(.pencil)
            .resizableImage(width: size.width * 0.04)
            .rotationEffect(.degrees(270))
            .onTapGesture {
                // TODO: 기능추가하기
                isWriting = true
            }
    }
}

#Preview {
    @State var isSheetPresented: Bool = true
    
    return WordView(isSheetPresented: $isSheetPresented)
}

//
//  WordView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/19/24.
//

import SwiftUI
import PencilKit
import UIKit

struct WordView: View {
    
    @State var isWriting: Bool = true
    // 현재 이미지 인덱스를 추적하는 상태 변수
    @State private var currentIndex = 0
    let selectedBook: WritingBook
    var onDismiss: () -> Void
    @State var canvas = PKCanvasView()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image(.blurBackground)
                        .resizable()
                        .scaledToFill()
                        .frame(height: geo.size.height)
                    
                    // 여우 그림, 글쓰기 영역
                    imageTextField(size: geo.size)
                    
                    WordCanvasView(canvas: $canvas, isWriting: $isWriting)
                    
                    // 창닫기, 앨범 저장하기
                    closeShareButton(size: geo.size)
                        .padding(.top, geo.size.height * 0.055)
                    
                    // 펜슬킷 도구 영역
                    VStack(spacing: -geo.size.height * 0.07) {
                        eraserButton(size: geo.size)
                        
                        pencilButton(size: geo.size)
                    } .padding(.bottom, geo.size.height * 0.08)
                    
                    // 다음버튼
                    nextButton(size: geo.size)
                        .opacity(currentIndex == (selectedBook.items.count - 1) ? 0 : 100)
                        .animation(.easeInOut(duration: 0), value: currentIndex)
                    
                    // 이전버튼
                    previousButton(size: geo.size)
                        .opacity(currentIndex == 0 ? 0 : 100)
                        .animation(.easeInOut(duration: 0), value: currentIndex)
                    
                    // 끝버튼
                    endButton(size: geo.size)
                        .opacity(currentIndex == (selectedBook.items.count - 1) ? 100 : 0)
                        .animation(.easeInOut(duration: 0), value: currentIndex)
                }
            }
            .ignoresSafeArea(.all)
        }
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
                    onDismiss()
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
               if currentIndex < selectedBook.items.count {
                   Image(selectedBook.items[currentIndex].image)
                       .resizableImage(width: size.width * 0.28)
                   
                   ZStack(alignment: .leading) {
                       Image(.canvasBackground)
                           .resizableImage(width: size.width * 0.7)
                       
                       HStack(spacing: size.width * 0.09) {
                           Image(.voiceIcon)
                               .padding(.bottom, 200)
                           
                           Image(selectedBook.items[currentIndex].word)
                       } .padding(.leading, size.width * 0.05)
                   }
               }
           }
    }
    
    // MARK: - 지우개 도구버튼
    @ViewBuilder
    func eraserButton(size: CGSize) -> some View {
        HStack {
            Spacer()
            
            Button(action: {
                withAnimation {
                    isWriting = false
                }
            }, label: {
                Image(.eraser)
                    .resizableImage(width: size.width * 0.067)
                    .rotationEffect(.degrees(270))
            }) .padding(.trailing, isWriting ? -40 : 0)
        }
    }
    
    // MARK: - 연필 도구버튼
    func pencilButton(size: CGSize) -> some View {
        HStack {
            Spacer()
            
            Button(action: {
                withAnimation {
                    isWriting = true
                }
            }, label: {
                Image(.pencil)
                    .resizableImage(width: size.width * 0.04)
                    .rotationEffect(.degrees(270))
            }) .padding(.trailing, isWriting ? 0 : -30)
        }
    }
    
    // MARK: - 다음으로 넘어가기 버튼
    @ViewBuilder
    func nextButton(size: CGSize) -> some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        // 배열의 범위를 벗어나지 않도록 다음 인덱스를 계산
                        if selectedBook.items.count > 0 {
                            currentIndex = (currentIndex + 1) % selectedBook.items.count
                        }
                        canvas.drawing = PKDrawing()
                    }
                }, label: {
                    HStack(spacing: size.width * 0.012) {
                        Text("다음으로")
                            .font(.bigTitle2)
                            .foregroundStyle(.darkgray)
                        
                        ZStack {
                            Circle()
                                .frame(width: size.width * 0.046)
                                .foregroundStyle(.darkgray)
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: size.width * 0.02))
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                })
            } .padding(.trailing, size.width * 0.15)
        } .padding(.bottom, size.height * 0.03)
    }
    
    // MARK: - 이전으로 넘어가기 버튼
    @ViewBuilder
    func previousButton(size: CGSize) -> some View {
        VStack {
            Spacer()
            
            HStack {
                Button(action: {
                    withAnimation {
                        // 배열의 범위를 벗어나지 않도록 다음 인덱스를 계산
                        if selectedBook.items.count > 0 {
                            currentIndex = (currentIndex - 1) % selectedBook.items.count
                        }
                        
                        canvas.drawing = PKDrawing()
                    }
                }, label: {
                    HStack(spacing: size.width * 0.012) {
                        ZStack {
                            Circle()
                                .frame(width: size.width * 0.046)
                                .foregroundStyle(.darkgray)
                            
                            Image(systemName: "chevron.left")
                                .font(.system(size: size.width * 0.02))
                                .bold()
                                .foregroundStyle(.white)
                        }
                        
                        Text("이전으로")
                            .font(.bigTitle2)
                            .foregroundStyle(.darkgray)
                    }
                })
                
                Spacer()
            } .padding(.leading, size.width * 0.15)
        } .padding(.bottom, size.height * 0.03)
    }
    
    // MARK: - 끝 버튼
    @ViewBuilder
    func endButton(size: CGSize) -> some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        // 배열의 범위를 벗어나지 않도록 다음 인덱스를 계산
                        if selectedBook.items.count > 0 {
                            currentIndex = (currentIndex + 1) % selectedBook.items.count
                        }
                        
                        onDismiss()
                    }
                }, label: {
                    HStack(spacing: size.width * 0.012) {
                        Text("끝")
                            .font(.bigTitle2)
                            .foregroundStyle(.darkgray)
                        
                        ZStack {
                            Circle()
                                .frame(width: size.width * 0.046)
                                .foregroundStyle(.darkgray)
                            
                            Image(systemName: "xmark")
                                .font(.system(size: size.width * 0.02))
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                })
            } .padding(.trailing, size.width * 0.15)
        } .padding(.bottom, size.height * 0.03)

    }
}

// MARK: - PKCanvasView
struct WordCanvasView: UIViewRepresentable {
    
    @Binding var canvas: PKCanvasView
    @Binding var isWriting: Bool
    
    var ink: PKInkingTool {
        PKInkingTool(.pencil, color: UIColor(.white), width: 15)
    }
    let eraser = PKEraserTool(.bitmap, width: 40)
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isWriting ? ink : eraser
        canvas.backgroundColor = .clear
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = isWriting ? ink : eraser
    }
}

#Preview {
    @State var isSheetPresented: Bool = true

    return WordView(selectedBook: WritingBook(name: "book1", items: [WritingItem(word: "foxFont", image: "fox")]), onDismiss: {})
}

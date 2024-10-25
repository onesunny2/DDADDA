//
//  DrawingView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/23/24.
//

import SwiftUI
import PencilKit
import UIKit

struct DrawingView: View {
    @State var sketchViewModel: SketchViewModel
    @Binding var selectSketch: String
    @Binding var selectedSketchName: String
    @Binding var isCanvasOn: Bool
    @State var isSelectedFinish: Bool = false
    @Binding var saveDate: String
    
    // PKCanvas 관련
    @State var canvas = PKCanvasView()
    @State var colors: [ColorModel] = selectColors
    @State var selectedColor: Color = .red
    @State var isPaletted: Bool = false
    @State var isWriting: Bool = true
    @State var toolType: PKInkingTool.InkType = .crayon
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                    .ignoresSafeArea(.all)
                
                drawingCanvasView(selectedColor: $selectedColor, canvas: $canvas, isWriting: $isWriting, toolType: $toolType)
                
                canvasImg(size: geo.size)
                    .allowsHitTesting(false)
                
                closeAndFinishButton()
                
                canvasName()
                
                drawingTool(size: geo.size)
                
                ColorPalette()
                
                FinishAlertView(sketchViewModel: sketchViewModel, isAlertClosed: $isSelectedFinish, isCanvasClosed: $isCanvasOn, saveDate: $saveDate, selectSketch: $selectSketch)
                    .opacity(isSelectedFinish ? 1 : 0)
            }
        }
    }
    
    // MARK: - 캔버스 이미지
    @ViewBuilder
    func canvasImg(size: CGSize) -> some View {
        Image("\(selectSketch)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width * 0.55)
    }
    
    // MARK: - 창닫기, 다했어요 버튼
    @ViewBuilder
    func closeAndFinishButton() -> some View {
        VStack {
            HStack {
                Image(.drawDismissButton)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120)
                    .onTapGesture {
                        isCanvasOn = false
                    }
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 234, height: 120)
                    .foregroundStyle(.buttonDraw)
                    .overlay {
                        Text("다했어요!")
                            .font(.bigTitle3)
                            .foregroundStyle(.darkTree)
                    }
                    .onTapGesture {
                        isSelectedFinish = true
                    }
            }
            
            Spacer()
        }
        .padding(.horizontal, 84)
        .padding(.top, 36)
    }
    
    // MARK: - 그림 이름
    @ViewBuilder
    func canvasName() -> some View {
        VStack {
            Text("\(selectedSketchName)")
                .font(.bigTitle1)
            
            Spacer()
        }
        .padding(.top, 64)
    }
    
    // MARK: - 그리기 도구 툴
    @ViewBuilder
    func drawingTool(size: CGSize) -> some View {
        HStack(spacing: 40) {
            // 되돌리기
            VStack {
                Spacer()
                
                HStack(spacing: 14) {
                    Circle()
                        .frame(width: 48)
                        .foregroundStyle(.buttonDraw)
                        .overlay {
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundStyle(.darkTree)
                                .font(.system(size: 24))
                        }
                        .onTapGesture {
                            canvas.undoManager?.undo()
                        }
                    
                    Circle()
                        .frame(width: 48)
                        .foregroundStyle(.buttonDraw)
                        .overlay {
                            Image(systemName: "arrow.uturn.right")
                                .foregroundStyle(.darkTree)
                                .font(.system(size: 24))
                        }
                        .onTapGesture {
                            canvas.undoManager?.redo()
                        }
                }
            }
            
            // 도구 툴
            HStack(spacing: 42) {
                Image(.crayon)
                    .onTapGesture {
                        withAnimation {
                            isWriting = true
                            toolType = .crayon
                        }
                    }
                    .offset(y: (isWriting && toolType == .crayon) ? -45 : 0)
                
                Image(.marker)
                    .onTapGesture {
                        withAnimation {
                            isWriting = true
                            toolType = .marker
                        }
                    }
                    .offset(y: (isWriting && toolType == .marker) ? -45 : 0)
                
                Image(.pencil)
                    .onTapGesture {
                        withAnimation {
                            isWriting = true
                            toolType = .pencil
                        }
                    }
                    .offset(y: (isWriting && toolType == .pencil) ? -45 : 0)
                
                Image(.eraser)
                    .onTapGesture {
                        withAnimation {
                            isWriting = false
                        }
                    }
                    .offset(y: isWriting == false ? -45 : 0)
            }
            .offset(y: size.height / 1.9)
        }
    }
    
    // MARK: - Color Palette
    @ViewBuilder
    func ColorPalette() -> some View {
        HStack{
            ZStack{
                Image(.palette)
                ForEach(Array(colors.enumerated()), id: \.element.id) { index, color in
                    Circle()
                        .frame(width: 58)
                        .foregroundStyle(color.color)
                        .offset(x: offsets[index].x, y: offsets[index].y)
                        .onTapGesture {
                            withAnimation {
                                selectedColor = color.color
                                isPaletted.toggle()
                            }
                        }
                }
            }
            .onTapGesture {
                withAnimation {
                    isPaletted = true
                }
            }
            Spacer()
        }
        .offset(x: isPaletted ? -60 : -140, y: isPaletted ? 400 : 530)  // TODO: 위치는 다시 잡아야 할 수도 있음
    }
}

// MARK: - PKCanvasView
struct drawingCanvasView: UIViewRepresentable {
    
    @Binding var selectedColor: Color
    @Binding var canvas: PKCanvasView
    @Binding var isWriting: Bool
    @Binding var toolType: PKInkingTool.InkType
    
    var ink: PKInkingTool {
        PKInkingTool(toolType, color: UIColor(selectedColor), width: 15)
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


//#Preview {
//    DrawingView(selectSketch: .constant("squirrel"), selectedSketchName: .constant("다람쥐"), isCanvasOn: .constant(true), todayDate: .constant(" "))
//}

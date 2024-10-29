//
//  FinishAlertView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 10/24/24.
//

import SwiftUI

struct FinishAlertView: View {
    @State var sketchViewModel: SketchViewModel
    @Binding var isAlertClosed: Bool
    @Binding var isCanvasClosed: Bool
    @Binding var saveDate: String
    @Binding var selectSketch: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                Image(.alertRabbit)
                    .padding(.bottom, -30)
                    .zIndex(1)
                
                UnevenRoundedRectangle(topLeadingRadius: 32, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 32)
                    .frame(width: 520, height: 185)
                    .foregroundStyle(.white)
                    .overlay {
                        VStack {
                            Text("잘했어요!")
                                .font(.badge1)
                                .padding(.bottom, 5)
                            Text("멋진 그림을 완성했다!")
                                .font(.itemTitle)
                            Text("엄마아빠한테 자랑해볼까?")
                                .font(.itemTitle)
                        }
                    }
                
                HStack(spacing: 0) {
                    UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 32, bottomTrailingRadius: 0, topTrailingRadius: 0)
                        .frame(width: 260, height: 74)
                        .foregroundStyle(.buttonLight)
                        .overlay {
                            Text("더 그리기")
                                .font(.badge2)
                                .foregroundStyle(.lightTree)
                        }
                        .onTapGesture {
                            isAlertClosed = false
                        }
                    
                    UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 32, topTrailingRadius: 0)
                        .frame(width: 260, height: 74)
                        .foregroundStyle(.buttonDark)
                        .overlay {
                            Text("저장하기")
                                .font(.badge2)
                                .foregroundStyle(.darkTree)
                        }
                        .onTapGesture {
                            if let index = sketchViewModel.animalSketch.firstIndex(where: { $0.sketchName == selectSketch }) {
                                sketchViewModel.addSaveData(to: sketchViewModel.animalSketch[index], saveDate: DateManager.todayDate, saveStamp: "stamp")
//                                sketchViewModel.animalSketch[index].saveDate = DateManager.todayDate
//                                sketchViewModel.animalSketch[index].saveStamp = "stamp"
                            } else if let index = sketchViewModel.insectSketch.firstIndex(where: { $0.sketchName == selectSketch }) {
                                sketchViewModel.addSaveData(to: sketchViewModel.insectSketch[index], saveDate: DateManager.todayDate, saveStamp: "stamp")
//                                sketchViewModel.insectSketch[index].saveDate = DateManager.todayDate
//                                sketchViewModel.insectSketch[index].saveStamp = "stamp"
                            }
                            isCanvasClosed = false
                        }
                }
            }
            .padding(.bottom, 170)
        }
    }
}

#Preview {
    FinishAlertView(sketchViewModel: SketchViewModel(), isAlertClosed: .constant(false), isCanvasClosed: .constant(false), saveDate: .constant(" "), selectSketch: .constant("rabbit"))
}

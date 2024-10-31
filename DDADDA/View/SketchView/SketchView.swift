//
//  SketchView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 9/11/24.
//

import SwiftUI

struct SketchView: View {
    @State var sketchViewModel: SketchViewModel = SketchViewModel()
    @State var isCanvasOn: Bool = false
    @State var allBookNum: Int = 10
    @State var saveDate: String = " "
    @State var currentCategory: String = "animal"
    @State var selectSketch: String = ""
    @State var selectedSketchName: String = ""
    @State var isAnimal: Bool = true
    @State var isRefreshed: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(height: geo.size.height)
                
                VStack {
                    backAndMenuButton(size: geo.size)
                    
                    Spacer()
                    
                    sketchBook(size: geo.size)
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isCanvasOn, content: {
                DrawingView(sketchViewModel: sketchViewModel, selectSketch: $selectSketch, selectedSketchName: $selectedSketchName, isCanvasOn: $isCanvasOn, saveDate: $saveDate)
            })
        }
    }
    
    // MARK: - 상단 뒤로가기, 동물/곤충 메뉴 버튼
    @ViewBuilder
    func backAndMenuButton(size: CGSize) -> some View {
        VStack {
            HStack(alignment: .top) {
                // 뒤로가기 버튼
                HStack(spacing: 0) {
                    BackButton(imgName: "backbutton")
                        .padding(.trailing, size.width * 0.012)
                    
                    Text("뒤로가기")
                        .font(.bigTitle2)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                // 메뉴 선택
                HStack(spacing: 30) {
                    VStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 288, height: 46)
                            .opacity(0.5)
                            .overlay {
                                HStack(spacing: 0) {
                                    Image(systemName: "face.smiling.inverse")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20))
                                        .padding(.trailing, 6)
                                    
                                    Text("나의 도감")
                                        .font(.itemTitle)
                                        .foregroundStyle(.white)
                                        .padding(.trailing, 80)
                                    
                                    Text("\(sketchViewModel.animalSketch.filter { $0.saveStamp != nil }.count + sketchViewModel.insectSketch.filter { $0.saveStamp != nil }.count)개")
                                        .font(.itemTitle)
                                        .foregroundStyle(.white)
                                        .frame(width: 39)
                                }
                            }
                        
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 288, height: 46)
                            .opacity(0.5)
                            .overlay {
                                HStack(spacing: 0) {
                                    Image(systemName: "book.closed.fill")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18))
                                        .padding(.trailing, 6)
                                    
                                    Text("전체 도감")
                                        .font(.itemTitle)
                                        .foregroundStyle(.white)
                                        .padding(.trailing, 80)
                                    
                                    Text("\(allBookNum)개")
                                        .font(.itemTitle)
                                        .foregroundStyle(.white)
                                        .frame(width: 39)
                                }
                            }
                    }
                    .padding(.trailing, 8)
                    
                    VStack {
                        Image(.gorillaIcon)
                        Text("동물")
                            .font(.badge2)
                    }
                    .onTapGesture {
                        isAnimal = true
                    }
                    
                    VStack {
                        Image(.ladyBugIcon)
                        Text("곤충")
                            .font(.badge2)
                    }
                    .onTapGesture {
                        isAnimal = false
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 84)
        .padding(.top, 50)
    }
    
    
    // MARK: - 스케치북
    @ViewBuilder
    func sketchBook(size: CGSize) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(isAnimal ? sketchViewModel.animalSketch : sketchViewModel.insectSketch, id: \.self) { sketch in
                    SketchBook(size: size, sketch: sketch, isCanvasOn: $isCanvasOn, selectSketch: $selectSketch, selectedSketchName: $selectedSketchName)
                    .padding(.bottom, size.height * 0.19)
                }
            }
        }
        .padding(.leading, 84)
    }
}

// MARK: - 스케치북 내용물
private struct SketchBook: View {
    let size: CGSize
    @State var sketch: MenuCategory
    
    @Binding var isCanvasOn: Bool
    @Binding var selectSketch: String
    @Binding var selectedSketchName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: -65) {
                Image(.sketchbookSpring)
                    .frame(width: size.width * 0.41)
                    .zIndex(1)
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(width: size.width * 0.39, height: size.height * 0.33)
                        .overlay(alignment: .bottomTrailing) {
                            Image("\(sketch.saveStamp ?? " ")")
                                .padding(.trailing, 20)
                                .padding(.bottom, 20)
                        }
                    
                    Image("\(sketch.sketchName)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.height * 0.3)
                    
                    if let savedDrawing = sketch.savedDrawing {
                        // 저장된 이미지가 있으면 표시
                        Image(uiImage: savedDrawing)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: size.height * 0.4)
                    } else {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(width: size.width * 0.39, height: size.height * 0.4)
                    }
                }
            }
            .onTapGesture {
                isCanvasOn = true
                selectSketch = sketch.sketchName
                selectedSketchName = sketch.name
            }
            
            Text("\(sketch.name)")
                .font(.bigTitle1)
                .padding(.leading, 10)
            
            Text(sketch.saveDate ?? " ")
                .font(.subTitle)
                .foregroundStyle(.white)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    SketchView()
}

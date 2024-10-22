//
//  SketchView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 9/11/24.
//

import SwiftUI

struct SketchView: View {
    @State var isCanvasOn: Bool = false
    @State var myBookNum: Int = 0
    @State var allBookNum: Int = 10
    @State var sketchName: String = "라쿤"
    @State var sketchImgName: String = "raccon"
    @State var sketchDate: String = "2024년 10월 22일"
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(height: geo.size.height)
                
                backAndMenuButton(size: geo.size)
                
                VStack(alignment: .leading) {
                    VStack(spacing: -30) {
                        Image(.sketchbookSpring)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.41)
                            .zIndex(1)
                        
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: geo.size.width * 0.39, height: geo.size.height * 0.33)
                            
                            Image("\(sketchImgName)")
                                .resizable()
                                .frame(width: geo.size.height * 0.33, height: geo.size.height * 0.33)
                                .aspectRatio(contentMode: .fit)
                                
                        }
                    }
                    
                    Text("\(sketchName)")
                        .font(.bigTitle1)
                        .padding(.leading, 10)
                    
                    Text("\(sketchDate)")
                        .font(.subTitle)
                        .foregroundStyle(.white)
                        .padding(.leading, 10)
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isCanvasOn, content: {
                
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
                                    
                                    Text("\(myBookNum)개")
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
                    
                    VStack {
                        Image(.ladyBugIcon)
                        Text("곤충")
                            .font(.badge2)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 84)
        .padding(.top, 50)
    }
    
    
    // MARK: - 날짜 변환 함수
    func todayDate() -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy년 MM월 dd일"
           return formatter.string(from: Date())
       }
}

#Preview {
    SketchView()
}

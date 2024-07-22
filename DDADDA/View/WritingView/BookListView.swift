//
//  BookListView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/19/24.
//

import SwiftUI

struct BookListView: View {
    @State var isSheetPresented: Bool = false
    @State private var selectedBook: WritingBook = firstBook[0]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(height: geo.size.height)
                
                bookList(size: geo.size)
                
                // 뒤로가기 버튼 커스텀
                backbutton(size: geo.size)
                    .padding(.leading, geo.size.width * 0.064)
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isSheetPresented) {
                    WordView(isSheetPresented: $isSheetPresented, selectedBook: selectedBook)
            }
        }
    }
    
    // MARK: - 책 리스트 화면
    @ViewBuilder
    func bookList(size: CGSize) -> some View {
        ZStack(alignment: .center) {
            // 하얀색 둥근 사각형 테두리
            RoundedRectangle(cornerRadius: 38)
                .foregroundStyle(.white)
                .frame(width: size.width * 0.87, height: size.height * 0.7)
                .position(x: size.width / 2, y: size.height / 2)
                .shadow(color: .black.opacity(0.2), radius: 24, x: 4, y: 7)
            
            // 숲 속 도서관 타이틀
            HStack {
                VStack {
                    HStack(spacing: size.width * 0.012) {
                        Image(.booksIcon)
                        
                        Text("숲 속 도서관")
                            .font(.bigTitle2)
                    }
                    Spacer()
                } .padding(.top, size.height * 0.16)
                
                Spacer()
            } .padding(.leading, size.width * 0.09)
            
            // 나무 판자 배경
            Image(.libraryWood)
                .resizable()
                .frame(width: size.width * 0.87, height: size.height * 0.55)
            
            // 그 안의 책 리스트
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: -size.height * 0.00485) {
                    HStack(alignment: .bottom) {
                        // 여우와 포도 책
                        Image(.book1)
                            .resizableImage(width: size.width * 0.15)
                            .onTapGesture {
                                // TODO: 코드 넣기
                                selectedBook = firstBook[0]
                                isSheetPresented = true
                            }
                        
                        // 단어 수, 책 권수
                        VStack(spacing: size.height * 0.007) {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 48)
                                    .frame(width: size.width * 0.22, height: size.height * 0.04)
                                    .opacity(0.5)
                                
                                HStack(spacing: size.width * 0.059) {
                                    HStack(spacing: size.width * 0.01) {
                                        Image(.bookIcon)
                                        Text("읽은 도서")
                                            .font(.itemTitle)
                                            .foregroundStyle(.white)
                                    }.padding(.leading, size.width * 0.024)
                                    // TODO: 나중에 데이터 갈아끼우기
                                    Text("2권")
                                        .font(.itemTitle)
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 48)
                                    .frame(width: size.width * 0.22, height: size.height * 0.04)
                                    .opacity(0.5)
                                
                                HStack(spacing: size.width * 0.059) {
                                    HStack(spacing: size.width * 0.01) {
                                        Image(.pencilIcon)
                                        Text("배운 단어")
                                            .font(.itemTitle)
                                            .foregroundStyle(.white)
                                    } .padding(.leading, size.width * 0.024)
                                    // TODO: 나중에 데이터 갈아끼우기
                                    Text("45개")
                                        .font(.itemTitle)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .padding(.bottom, size.height * 0.02)
                    }
                    
                    // 선반 및 그림자
                    Rectangle()
                        .frame(width: size.width * 0.6, height: size.height * 0.016)
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.5), radius: 24, x: 0, y: 50)
                        .padding(.bottom, size.height * 0.085)
                    
                    VStack(spacing: -size.height * 0.00485) {
                        // 나머지 책
                        HStack(spacing: size.width * 0.002) {
                            ForEach(writingBooks) { book in
                                Image(book.name)
                                    .resizableImage(width: size.width * 0.15)
                                    .onTapGesture {
                                        // TODO: 코드 넣기
                                        selectedBook = book
                                        isSheetPresented = true
                                    }
                            }
                        } .padding(.bottom, -size.height * 0.01)
                        
                        // 선반 및 그림자
                        Rectangle()
                            .frame(width: size.width * 0.6, height: size.height * 0.016)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.5), radius: 24, x: 0, y: 50)
                            .padding(.bottom, size.height * 0.085)
                    }
                }
            }
            .padding(.top, size.height * 0.04)
            .frame(width: size.width * 0.87, height: size.height * 0.55)
            .position(x: size.width * 0.5, y: size.height * 0.5)
        }
    }
    
    // MARK: - 뒤로가기 버튼 커스텀
    @ViewBuilder
    func backbutton(size: CGSize) -> some View {
        HStack {
            VStack {
                HStack(spacing: 0) {
                    BackButton(imgName: "backbutton")
                        .padding(.trailing, size.width * 0.012)
                    
                    Text("뒤로가기")
                        .font(.bigTitle2)
                        .foregroundStyle(.white)
                }
                .padding(.top, size.height * 0.05)
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    BookListView()
}

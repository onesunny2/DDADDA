//
//  LibraryView.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/15/24.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {

                
                Image(.blurBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .frame(height: geo.size.height)
                
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 38)
                        .foregroundStyle(.white)
                        .frame(width: geo.size.width * 0.87, height: geo.size.height * 0.68)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        .shadow(color: .black.opacity(0.2), radius: 24, x: 4, y: 7)
                }
                
                // 뒤로가기 버튼 커스텀
                HStack {
                    VStack {
                        HStack(spacing: 0) {
                            BackButton(imgName: "backbutton")
                                .padding(.trailing, geo.size.width * 0.012)
                            
                            Text("뒤로가기")
                                .font(.custom("HSSantokki", size: 42))
                                .foregroundStyle(.white)
                        }
                            .padding(.top, geo.size.height * 0.05)
                        Spacer()
                    }
                    Spacer()
                } .padding(.leading, geo.size.width * 0.064)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LibraryView()
}

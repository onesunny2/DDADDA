//
//  BackbuttonCustom.swift
//  DDADDA
//
//  Created by Lee Wonsun on 7/15/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var PresentationMode
    var imgName: String
    
    var body: some View {
        Button(action: {
            PresentationMode.wrappedValue.dismiss()
        }) {
            Image("\(imgName)")
        }
    }
}

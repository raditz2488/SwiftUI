//
//  BevelText.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 15/12/22.
//

import SwiftUI

struct BevelText: View {
    let width: CGFloat
    let height: CGFloat
    let text: String
    
    var body: some View {
        Text(text)
            .frame(width: width, height: height)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.element)
                        .northWestShadow(radius: 3, offset: 1)
                    Capsule()
                        .inset(by: 3)
                        .fill(Color.element).southEastShadow(radius: 1, offset: 1)
                }
            )
    }
}


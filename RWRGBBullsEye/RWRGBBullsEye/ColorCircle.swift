//
//  ColorCircle.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 11/12/22.
//

import SwiftUI

struct ColorCircle: View {
    let color: RGB
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(rgb: color))
                .padding(20)
        }
        .frame(width: size, height: size)
    }
}

//
//  ColorCircle.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 11/12/22.
//

import SwiftUI

struct ColorCircle: View {
    var color: RGB
    
    var body: some View {
        ZStack {
            Color.element
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(rgb: color))
                .padding(20)
        }
    }
}

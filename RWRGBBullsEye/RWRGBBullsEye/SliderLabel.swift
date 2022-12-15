//
//  SliderLabel.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 15/12/22.
//

import SwiftUI

struct SliderLabel: View {
    @Binding var value: Double
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }.font(.subheadline)
            .padding(.horizontal)
    }
}

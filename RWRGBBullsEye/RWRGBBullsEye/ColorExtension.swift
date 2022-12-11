//
//  ColorExtension.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 11/12/22.
//

import SwiftUI

extension Color {
    init(rgb: RGB) {
        self.init(red: rgb.r, green: rgb.g, blue: rgb.b)
    }
    
    static var element: Color { Color("Element") }
    static var highlight: Color { Color("Highlight") }
    static var shadow: Color { Color("Shadow") }
}


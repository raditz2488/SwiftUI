//
//  RGB.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 15/12/22.
//

import SwiftUI

struct RGB {
    var r, g, b: Double
    
    var text: String {
        "R: \(String(format: "%.0f", r * 255.0)), G: \(String(format: "%.0f", g * 255.0)), B: \(String(format: "%.0f", b * 255.0))"
    }
}

extension RGB {
    static func random() -> RGB {
        let r = Double.random(in: 0...1)
        let g = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        return RGB(r: r, g: g, b: b)
    }
}

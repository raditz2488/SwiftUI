//
//  ContentView.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    var game = Game(target: .random())
    
    var body: some View {
        VStack {
            ColorRGBView(rgb: game.target)
            Text("R: ???, G: ???, B: ???")
            ColorRGBView(rgb: RGB(r: 0.0, g: 255.0, b: 255.0))
            Text(RGB(r: 0.0, g: 255.0, b: 255.0).text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorRGBView: View {
    
    let rgb: RGB
    
    var body: some View {
        Color(red: rgb.r / 255.0, green: rgb.g / 255.0, blue: rgb.b / 255.0)
    }
}

struct RGB {
    let r, g, b: Double
    
    var text: String {
        "R: \(String(format: "%.2f", r)), G: \(String(format: "%.2f", g)), B: \(String(format: "%.2f", b))"
    }
}

extension RGB {
    static func random() -> RGB {
        let r = floor(Double.random(in: 0.0...255.0))
        let g = floor(Double.random(in: 0.0...255.0))
        let b = floor(Double.random(in: 0.0...255.0))
        return RGB(r: r, g: g, b: b)
    }
}

struct Game {
    var target: RGB
}

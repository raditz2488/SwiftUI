//
//  ContentView.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game(target: .random())
    @State var guess: RGB = RGB(r: 0.5, g: 0.5, b: 0.5)
    
    var body: some View {
        VStack {
            ColorRGBView(rgb: game.target)
            Text("R: ???, G: ???, B: ???")
            ColorRGBView(rgb: guess)
            Text(guess.text)
            Slider(value: $guess.r)
                .accentColor(.red)
            Slider(value: $guess.g)
                .accentColor(.green)
            Slider(value: $guess.b)
                .accentColor(.blue)
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
        Color(red: rgb.r, green: rgb.g, blue: rgb.b)
    }
}

struct RGB {
    var r, g, b: Double
    
    var text: String {
        "R: \(String(format: "%.2f", r * 255.0)), G: \(String(format: "%.2f", g * 255.0)), B: \(String(format: "%.2f", b * 255.0))"
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

struct Game {
    var target: RGB
}

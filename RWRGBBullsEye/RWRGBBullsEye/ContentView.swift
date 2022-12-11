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
    @State var displayAlert = false
    
    var body: some View {
        VStack {
            ColorRGBView(rgb: game.target)
            Text("R: ???, G: ???, B: ???")
            ColorRGBView(rgb: guess)
            Text(guess.text)
            SliderLabel(value: $guess.r, trackColor: .red)
            SliderLabel(value: $guess.g, trackColor: .green)
            SliderLabel(value: $guess.b, trackColor: .blue)
            
            Button("Hit me!") {
                displayAlert = true
            }
        }.alert(isPresented: $displayAlert) {
            Alert(title: Text("You scored!!!"),
                  message: Text("???"),
                  dismissButton: .default(Text("Ok"),
                                          action: {
                displayAlert = false
            }))
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

struct SliderLabel: View {
    @Binding var value: Double
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }.padding(.horizontal)
    }
}

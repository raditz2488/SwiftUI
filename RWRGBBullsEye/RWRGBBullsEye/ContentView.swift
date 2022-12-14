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
        ZStack {
            Color.element
            VStack {
                ColorCircle(color: game.target)
                BelevelText(width: 300, height: 48, text: "R: ???, G: ???, B: ???")
                ColorCircle(color: guess)
                BelevelText(width: 300, height: 48, text: guess.text)
                SliderLabel(value: $guess.r, trackColor: .red)
                SliderLabel(value: $guess.g, trackColor: .green)
                SliderLabel(value: $guess.b, trackColor: .blue)
                
                Button("Hit me!") {
                    displayAlert = true
                }
                .buttonStyle(NeuButtonStyle(width: 300, height: 48))
            }.alert(isPresented: $displayAlert) {
                Alert(title: Text("You scored!!!"),
                      message: Text("???"),
                      dismissButton: .default(Text("Ok"),
                                              action: {
                    displayAlert = false
                }))
            }
        }.edgesIgnoringSafeArea(.all)
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


struct BelevelText: View {
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

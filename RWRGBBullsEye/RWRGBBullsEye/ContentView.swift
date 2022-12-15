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
    
    let circleSizeProportion: CGFloat = 0.275
    
    let labelHeightProportion: CGFloat = 0.06
    let labelWidthProportion: CGFloat = 0.53
    
    let buttonHeightProportion: CGFloat = 0.06
    let buttonWidthProportion: CGFloat = 0.87
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element.edgesIgnoringSafeArea(.all)
                VStack {
                    ColorCircle(color: game.target, size: proxy.size.height * circleSizeProportion)
                    BevelText(width: labelWidthProportion * proxy.size.width,
                              height: labelHeightProportion * proxy.size.height,
                              text: "R: ???, G: ???, B: ???")
                    ColorCircle(color: guess, size: proxy.size.height * circleSizeProportion)
                    BevelText(width: labelWidthProportion * proxy.size.width,
                              height: labelHeightProportion * proxy.size.height,
                              text: guess.text)
                    SliderLabel(value: $guess.r, trackColor: .red)
                    SliderLabel(value: $guess.g, trackColor: .green)
                    SliderLabel(value: $guess.b, trackColor: .blue)
                    
                    Button("Hit me!") {
                        displayAlert = true
                    }
                    .buttonStyle(NeuButtonStyle(
                        width: buttonWidthProportion * proxy.size.width,
                        height: buttonHeightProportion * proxy.size.height
                    )
                    )
                }.alert(isPresented: $displayAlert) {
                    Alert(title: Text("You scored!!!"),
                          message: Text("???"),
                          dismissButton: .default(Text("Ok"),
                                                  action: {
                        displayAlert = false
                    }))
                }
                .font(.headline)
                .edgesIgnoringSafeArea(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 8")
            ContentView()
                .previewDevice("iPhone 13 mini")
            ContentView()
                .previewDevice("iPhone 13")
        }
    }
}

struct Game {
    var target: RGB
}

//
//  ContentView.swift
//  RWRGBBullsEye
//
//  Created by Rohan Bhale on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ColorRGBView(rgb: RGB(r: 255.0, g: 255.0, b: 255.0))
            Text("R: ???, G: ???, B: ???")
            ColorRGBView(rgb: RGB(r: 0.0, g: 0.0, b: 0.0))
            Text("R: 0.0, G: 0.0, B: 0.0")
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
    let r, g, b: Double
}

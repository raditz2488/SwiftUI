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
            Color(red: 255.0, green: 255.0, blue: 255.0)
            Text("R: ???, G: ???, B: ???")
            Color(red: 0.0, green: 0.0, blue: 0.0)
            Text("R: 0.0, G: 0.0, B: 0.0")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

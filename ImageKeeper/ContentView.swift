//
//  ContentView.swift
//  ImageKeeper
//
//  Created by Sebastian Marquez Rojas on 15/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, keeper!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

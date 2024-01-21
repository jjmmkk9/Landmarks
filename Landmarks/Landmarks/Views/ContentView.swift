//
//  ContentView.swift
//  Landmarks
//
//  Created by me on 2024/01/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

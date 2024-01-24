//
//  ContentView.swift
//  Landmarks
//
//  Created by me on 2024/01/17.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab{
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection) {
//            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
//            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            CategoryHome()
                .tabItem { Label("Featured", systemImage: "star") }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem { Label("List", systemImage: "list.bullet") }
                .tag(Tab.list)
            
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

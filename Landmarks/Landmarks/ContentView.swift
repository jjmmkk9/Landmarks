//
//  ContentView.swift
//  Landmarks
//
//  Created by me on 2024/01/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //You can use a stack to return multiple views from a body property.
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack (alignment: .leading){
                Text("Turtle Rock")
                    .font(.title)
                HStack{
                    Text("Joshua Tree National Park")
                    
                    Spacer()//컨텐츠에 의해서 크기가 정의되는 것이 아니라 상위 뷰의 모든 공간을 사용한다
                    
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            Spacer() //spacer로 모든 요소를 맨위로 올려버림(Vstack)
        }
    }
}

#Preview {
    ContentView()
}

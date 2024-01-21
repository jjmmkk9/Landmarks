//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 조문기 on 1/21/24.
//

import SwiftUI

struct FavoriteButton: View {
    //@Binding은 부모 view의 @state와 같은 값을 양방향으로 연결되도록 해준다.
    @Binding var isSet : Bool
    var body: some View {
        Button{
            //버튼의 기능 bool을 토글하기
            isSet.toggle()
        } label: {
            //버튼의 모양
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(IconOnlyLabelStyle())
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    //Cannot convert value of type 'Bool' to expected argument type 'Binding<Bool>'
    FavoriteButton(isSet: .constant(true))
}

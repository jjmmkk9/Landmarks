//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/24/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile : Profile
    
    var body: some View {
        List{
            HStack {
                Text("Username") //레이블
                Spacer()
                TextField("Username",text: $profile.username) //문자열 바인딩
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}

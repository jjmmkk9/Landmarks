//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 조문기 on 1/22/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode // editMode 가 뭐죵
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack{
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive{ //editMode가 비활성화면 프로필요약 보여줌
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

#Preview {
    //이 뷰의 자식인 ProfileSummary는 속성을 사용합니다. 따라서 수정자가 없으면 미리 보기가 실패합니다.
    ProfileHost()
        .environment(ModelData())
}

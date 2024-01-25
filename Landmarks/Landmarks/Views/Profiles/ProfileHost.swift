//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 조문기 on 1/22/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode // editMode로 edit중인지 아니니지 확인
    
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack{
                if editMode?.wrappedValue == .active {
                        //디자인 차이가 없어도 role이 .cancel 이면 실제 프로필 데이터에 편집 내용을 적용하지 않는다.
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive{ //editMode가 비활성화면 ProfileSummary 보여줌
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear{ // draftProfile에 실제 디폴트 프로필 주입(복사)
                        draftProfile = modelData.profile
                    }
                    .onDisappear{ //모델 디폴트 프로필에 복사본 반영
                        modelData.profile = draftProfile
                    }
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

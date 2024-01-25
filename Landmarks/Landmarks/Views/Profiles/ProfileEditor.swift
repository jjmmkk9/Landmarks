//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 비긴어브랜드 on 1/24/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile : Profile
    
    var dateRange : ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    
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
                    //Picker selection 요소는 기본 값 {다른 값은 클로저 안에 뿌리기
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto){
                ForEach(Profile.Season.allCases){ season in
                    Text(season.rawValue).tag(season)
                }
            }
                //in프로퍼티에 ClosedRange<Date>주면 특정 기간 안에서 선택하게
            DatePicker(selection: $profile.goalDate, in: dateRange , displayedComponents: .date){
                Text("Goal date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}

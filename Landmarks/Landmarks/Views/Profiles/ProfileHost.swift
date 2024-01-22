//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 조문기 on 1/22/24.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
}

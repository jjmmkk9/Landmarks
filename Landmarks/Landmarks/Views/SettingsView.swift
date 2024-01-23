//
//  SettingsView.swift
//  Landmarks
//
//  Created by 조문기 on 1/22/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedSeason: Profile.Season = .spring
        
        var body: some View {
            Picker("Select a Season", selection: $selectedSeason) {
                ForEach(Profile.Season.allCases, id: \.self) { season in
                    Text(season.rawValue)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("Selected Season : \(selectedSeason.rawValue)")
                .padding()
        }
}

#Preview {
    SettingsView()
}

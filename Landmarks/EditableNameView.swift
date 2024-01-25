//
//  EditableNameView.swift
//  Landmarks
//
//  Created by 조문기 on 1/25/24.
//

import SwiftUI

struct EditableNameView: View {
   @Environment(\.editMode) var mode
   @State var name = ""
   var body: some View {
      TextField("Name", text: $name)
         .disabled(mode?.wrappedValue == .inactive)
       
       EditButton()
   }
}

#Preview {
    EditableNameView()
}

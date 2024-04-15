//
//  EditChoreView.swift
//  NeedMoAllowance
//
//  Created by Marc Schwartz on 4/15/24.
//

import SwiftData
import SwiftUI

struct EditChoreView: View {
    @Bindable var chore: Chore

    var body: some View {
        Form {
            TextField("Name", text: $chore.name)
        }
        .navigationTitle("Edit Chore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Chore.self)
//        let example = Chore(name: "Clean your room", value: 0.50, isCompleted: false)
//        return EditChoreView(chore: example)
//    } catch {
//        fatalError("Failed to create model container.")
//    }
//}

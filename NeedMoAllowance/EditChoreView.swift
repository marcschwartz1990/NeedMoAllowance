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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Chore.self)
        let example = Chore(name: "Clean your room", value: 0.50, isCompleted: false)
        return EditChoreView(chore: example)
    } catch {
        fatalError("Failed to create model container.")
    }
}

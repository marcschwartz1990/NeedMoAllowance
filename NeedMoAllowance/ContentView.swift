//
//  ContentView.swift
//  NeedMoAllowance
//
//  Created by Marc Schwartz on 4/14/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var chores: [Chore]
    var body: some View {
        NavigationStack {
            List {
                ForEach(chores) { chore in
                    NavigationLink(value: chore) {
                        ChoreView(chore: chore)
                    }
                }
                .onDelete(perform: deleteChores)
            }
            .toolbar {
                Button("Add Samples", action: addSampleChores)
            }
            .navigationTitle("Chores")
            .navigationDestination(for: Chore.self, destination: EditChoreView.init)
        }
    }

    func addSampleChores() {
        let cleanRoom = Chore(name: "Clean your room", value: 0.50)
        let washDishes = Chore(name: "Wash the dishes", value: 0.75)
        let makeBed = Chore(name: "Make the bed", value: 0.68)

        modelContext.insert(cleanRoom)
        modelContext.insert(washDishes)
        modelContext.insert(makeBed)
    }

    func deleteChores(_ indexSet: IndexSet) {
        for index in indexSet {
            let chore = chores[index]
            modelContext.delete(chore)
        }
    }
}

struct ChoreView: View {
    @Environment(\.modelContext) var modelContext
    let chore: Chore

    @State private var isCompleted = false
    var body: some View {
        HStack {
            Text(chore.name)
            Text(String(chore.value))
            Toggle("", isOn: $isCompleted)
        }
    }
}

#Preview {
    ContentView()
}

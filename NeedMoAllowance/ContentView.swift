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
    @State private var path = [Chore]()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chores) { chore in
                    NavigationLink(value: chore) {
                        ChoreView(chore: chore)
                    }
                }
                .onDelete(perform: deleteChores)
            }
            .toolbar {
                Button("Add Chore", systemImage: "plus", action: addChore)
            }
            .navigationTitle("Chores")
            .navigationDestination(for: Chore.self, destination: EditChoreView.init)
        }
    }

    func addChore() {
        let chore = Chore()
        modelContext.insert(chore)
        path = [chore]
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
    @Bindable var chore: Chore
    var body: some View {
        HStack {
            Text(chore.name)
            Text(String(format: "%.2f", chore.value))
            Toggle("", isOn: $chore.isCompleted)
        }
    }
}

#Preview {
    ContentView()
        .onAppear {
            print(PaymentValue.getPaymentValues())
        }
}

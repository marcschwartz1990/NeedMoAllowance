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
    @State private var selectedAmount = 1.00

    var body: some View {
        Form {
            TextField("Name", text: $chore.name)
            Picker("Amount", selection: $selectedAmount) {
                ForEach(PaymentValue.getPaymentValues(), id: \.self) {
                    Text(String(format: "%.2f", $0))
                }
            }
            Button {
                chore.value = selectedAmount
            } label: {
                Text("Save")
            }
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

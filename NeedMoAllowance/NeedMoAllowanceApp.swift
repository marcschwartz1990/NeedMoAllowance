//
//  NeedMoAllowanceApp.swift
//  NeedMoAllowance
//
//  Created by Marc Schwartz on 4/14/24.
//

import SwiftData
import SwiftUI

@main
struct NeedMoAllowanceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Chore.self)
    }
}

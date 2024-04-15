//
//  Chore.swift
//  NeedMoAllowance
//
//  Created by Marc Schwartz on 4/14/24.
//

import Foundation
import SwiftData

@Model
class Chore {
    var name: String
    var value: Double
    var isCompleted: Bool

    init(name: String = "", value: Double = 0.0, isCompleted: Bool = false) {
        self.name = name
        self.value = value
        self.isCompleted = isCompleted
    }
}

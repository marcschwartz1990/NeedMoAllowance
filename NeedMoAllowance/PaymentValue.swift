//
//  PaymentValue.swift
//  NeedMoAllowance
//
//  Created by Marc Schwartz on 4/15/24.
//

import Foundation

struct PaymentValue {
    static func getPaymentValues() -> [Double] {
        var values: [Double] = []
        let increment = 0.25
        var currentValue = 0.0
        for _ in 1...20 {
            values.append(currentValue + increment)
            currentValue += increment
        }

        return values
    }
}

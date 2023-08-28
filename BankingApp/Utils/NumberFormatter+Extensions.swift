//
//  NumberFormatter+Extensions.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

extension NumberFormatter {
    func dollarsFromAmount(_ amount: Double) -> String {
        var result = ""
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let formattedAmount = formatter.string(from: NSNumber(value: amount)) else {
            return ""
        }
        result = String("$" + formattedAmount)
        if amount.truncatingRemainder(dividingBy: 100) == 0 {
            result.append(".00")
        }
        return result
    }
}

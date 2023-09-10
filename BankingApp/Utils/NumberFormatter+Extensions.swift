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
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.positivePrefix = "$"
        formatter.negativePrefix = "-$"

        guard let formattedAmount = formatter.string(from: NSNumber(value: amount)) else {
            return ""
        }
        return formattedAmount
    }
}

//
//  AccountsProvider.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct AccountsProvider: ProvidesAccounts {
    static func provideAccounts() -> [Account] {
        guard let data = UIImage(named: "placeholder")?.pngData()
        else {
            return []
        }

        return [
            Account(amount: 11350, availible: 12200, name: "Savings", image: data),
            Account(amount: 3500, availible: 2000, name: "Daily", image: data),
            Account(amount: 33322, availible: 23232, name: "MegaAccount", image: data),
            Account(amount: 7500, availible: 7500, name: "Big Account", image: data),
            Account(amount: 9000, availible: 9000, name: "My account", image: data),
            Account(amount: 100, availible: 100, name: "Other Savings", image: data),
            Account(amount: 16500, availible: 16500, name: "Spending", image: data)
        ]
    }
}

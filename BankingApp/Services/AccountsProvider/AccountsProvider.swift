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
        guard let jsonURL = Bundle.main.url(forResource: "AccountData", withExtension: "json") else {
            fatalError("Could not find JSON file")
        }
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let accounts = try decoder.decode(UserAccounts.self, from: jsonData)
            return accounts.accounts
        } catch {
            fatalError("Failed To decode")
        }
    }
}

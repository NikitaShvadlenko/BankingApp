//
//  UserAccounts.swift
//  BankingApp
//
//  Created by Nikita Shvad on 27.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

struct UserAccounts: Decodable {
    let name: String
    let accounts: [Account]
}

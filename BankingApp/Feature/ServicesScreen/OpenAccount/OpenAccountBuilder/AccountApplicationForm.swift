//
//  AccountApplicationForm.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum AccountApplicationStatus {
    case success
    case failed(reason: String)
}

struct AccountApplicationForm {
    let status: AccountApplicationStatus
    let accountType: String
    let monthlyFee: Double
}

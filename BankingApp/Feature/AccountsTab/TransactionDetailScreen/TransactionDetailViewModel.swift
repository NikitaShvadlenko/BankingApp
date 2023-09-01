//
//  TransactionDetailViewModel.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

struct TransactionDetailViewModel {
    let name: String
    let amount: Double
    let date: Date
    let type: String
    let cardNumber: String
    let balanceAfterTransaction: Double
}

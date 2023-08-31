//
//  Account.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

struct Account: Codable {
    let amount: Double
    let availible: Double
    let name: String
    let image: URL
    let number: String
    let transactions: [Transaction]
    let accountName: String
    let type: AccountType
}

struct Transaction: Codable, Hashable {
    let identifier = UUID()
    let sentToAccount: String
    let amount: Double
    let dateSent: Date
    let dateProcessed: Date
    let transactionType: TransactionType
    let transactionDetails: TransactionDetails

    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

}

struct TransactionDetails: Codable {
    let balanceAfterTransaction: Double
    let detail: String
}

enum TransactionType: String, Codable {
    case transfer = "Transfer"
    case withdrawal = "Withdrawal"
    case credit = "Credit"
    case visaPurchase = "Visa Purchase"
    case onlinePurchase = "Online Purchase"
}

enum AccountType: String, Codable {
    // swiftlint:disable identifier_name
    case go = "Go"
    case savings = "Savings"
    case online = "Online Account"
}

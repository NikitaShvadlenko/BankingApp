//
//  ApplicationAccountDescriptionProvider.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

struct ApplicationAccountDescriptionProvider: ProvidesAccountApplicationDescription {
     func fetchApplicationDescription() -> [ApplicationAccountDescription] {
        let accounts = [
            ApplicationAccountDescription(
                accountName: "Go account",
                accountDescription: "Great if you like to bank electronically.",
                monthlyFee: 0,
                descriptionFields: [
                    "$0 automated transaction fee",
                    "$3 fee per manual transaction"
                ],
                interestRates: nil
            ),
            ApplicationAccountDescription(
                accountName: "Freedom account",
                accountDescription: "Bank with no transaction fees.",
                monthlyFee: 5,
                descriptionFields: [
                    "Monthly account fee waived each month you deposit at least $2,500",
                    "$0 automated transaction fee",
                    "$0 fee per manual transaction"
                ],
                interestRates: nil
            ),
            ApplicationAccountDescription(
                accountName: "Select Account",
                accountDescription: "An interest bearing everyday account",
                monthlyFee: 6,
                descriptionFields: [
                    "Monthly account fee waived if you keep an average monthly balance of $5000 or more",
                    "$0 automated transaction fee",
                    "$0 fee per manual transaction"
                ],
                interestRates: [
                    InterestRateDescription(
                        lowerBound: 0,
                        upperBound: 4999.99,
                        interestDescription: "0.00% p.a."
                    ),
                    InterestRateDescription(
                        lowerBound: 5000,
                        upperBound: nil,
                        interestDescription: "1.40% p.a. on entire balance"
                    )
                ]
            )
        ]
        return accounts
    }
}

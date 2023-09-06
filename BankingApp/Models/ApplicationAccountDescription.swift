//
//  ApplicationAccountDescription.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

struct ApplicationAccountDescription {
    let accountName: String
    let accountDescription: String
    let monthlyFee: Double
    let descriptionFields: [String]?
    let interestRates: [InterestRateDescription]?
}

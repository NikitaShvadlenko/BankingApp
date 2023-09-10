//
//  AccountApplicationDetailViewModel.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

struct AccountApplicationDetailViewModel {
    let date: Date
    let accountName: String
    let reason: String?
    let applicationStatus: ApplicationStatus
}

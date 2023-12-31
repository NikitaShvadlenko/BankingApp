//
//  ProvidesAccounts.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol ProvidesAccounts {
    func fetchUserDetails(
        for name: String,
        completion: @escaping (Result<[Account], Error>) -> Void
    )
}

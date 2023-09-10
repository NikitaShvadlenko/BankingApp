//
//  AccountApplicationDetailContract.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol AccountApplicationDetailViewInput: AnyObject {
    func configureViews(with viewModel: AccountApplicationDetailViewModel)
}

protocol AccountApplicationDetailViewOutput {
    func viewDidLoad(_ view: AccountApplicationDetailViewInput)
}

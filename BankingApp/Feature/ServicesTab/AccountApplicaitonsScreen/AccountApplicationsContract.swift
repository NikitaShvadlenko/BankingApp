//
//  AccountApplicationsContract.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol AccountApplicationsViewInput: AnyObject {
    func configureViews()
}

protocol AccountApplicationsViewOutput {
    func viewDidLoad(_ view: AccountApplicationsViewInput)
}

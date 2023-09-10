//
//  AccountApplicationsTableViewManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesAccountApplicationsTable: UITableViewDataSource, UITableViewDelegate {
    func setApplications(_ applications: [AccountApplication])
}

final class AccountApplicationsTableViewManager {

}

// MARK: - UITableViewDataSource
extension AccountApplicationsTableViewManager: UITableViewDataSource {

}

// MARK: - UITableViewDelegate
extension AccountApplicationsTableViewManager: UITableViewDelegate {

}

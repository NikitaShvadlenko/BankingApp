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

final class AccountApplicationsTableViewManager: NSObject {
    var applications: [AccountApplication] = []
}

extension AccountApplicationsTableViewManager: ManagesAccountApplicationsTable {
    func setApplications(_ applications: [AccountApplication]) {
        self.applications = applications
    }
}

// MARK: - UITableViewDataSource
extension AccountApplicationsTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        applications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(AccountApplicationTableViewCell.self)", for: indexPath
        ) as? AccountApplicationTableViewCell
        else { fatalError() }
        let application = applications[indexPath.row]
        guard let status = ApplicationStatus(rawValue: application.applicationStatus) else {
            return cell
        }
        cell.configure(
            date: application.date,
            accountName: application.accountType,
            status: status
        )
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AccountApplicationsTableViewManager: UITableViewDelegate {

}

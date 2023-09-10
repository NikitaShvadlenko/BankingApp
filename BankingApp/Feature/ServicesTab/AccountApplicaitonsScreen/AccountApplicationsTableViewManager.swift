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
    var applications: [AccountApplication] { get }
}

protocol AccountApplicationsTableManagerDelegate: AnyObject {
    func accountApplicationsTableManager(_ manager: ManagesAccountApplicationsTable, didSelectRowAt indexPath: IndexPath)
}

final class AccountApplicationsTableViewManager: NSObject {
    weak var delegate: AccountApplicationsTableManagerDelegate?
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
        cell.configure(
            date: application.date,
            accountName: application.accountType,
            status: application.applicationStatus
        )
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AccountApplicationsTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.accountApplicationsTableManager(self, didSelectRowAt: indexPath)
    }
}

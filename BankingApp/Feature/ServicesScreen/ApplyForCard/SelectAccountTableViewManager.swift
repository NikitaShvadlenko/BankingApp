//
//  SelectAccountTableViewManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesAccountSelectionTableView: UITableViewDataSource, UITableViewDelegate {
    var accounts: [ApplicationAccountDescription] { get }
    func setAccounts(_ accounts: [ApplicationAccountDescription])
}

final class SelectAccountTableViewManager: NSObject {
    var accounts: [ApplicationAccountDescription] = []
}

extension SelectAccountTableViewManager: ManagesAccountSelectionTableView {
    func setAccounts(_ accounts: [ApplicationAccountDescription]) {
        self.accounts = accounts
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(AccountSelectionCell.self)", for: indexPath
        ) as? AccountSelectionCell
        else {
            fatalError("Failed to dequeue cell")
        }
        cell.configure(viewModel: accounts[indexPath.row])
        return cell
    }
}

//
//  AccountsScreenTableManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesAccountsScreenTable: UITableViewDataSource, UITableViewDelegate {
    var accounts: [Account] { get }
    func setAccountDisplayStyle(_ style: AccountDisplayStyle)
    func setAccounts(_ accounts: [Account])

}

final class AccountsScreenTableManager: NSObject {
    var style = AccountDisplayStyle.list
    var accounts: [Account] = []
}

extension AccountsScreenTableManager: ManagesAccountsScreenTable {
    func setAccountDisplayStyle(_ style: AccountDisplayStyle) {
        self.style = style
    }

    func setAccounts(_ accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsScreenTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(AccountOverviewCell.self)", for: indexPath
        ) as? AccountOverviewCell else {
            fatalError("Failed to dequeue cell")
        }
        let account = accounts[indexPath.row]
        cell.configure(
            style: style,
            imageData: account.image,
            accountName: account.name,
            amount: account.amount,
            availible: account.availible
        )
        return cell
    }
}

extension AccountsScreenTableManager: UITableViewDelegate {

}

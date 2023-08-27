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
    var tableView: UITableView? { get set }
    func setAccountDisplayStyle(_ style: AccountDisplayStyle)
    func setAccounts(_ accounts: [Account])
}

final class AccountsScreenTableManager: NSObject {
    var style: AccountDisplayStyle = .list {
        didSet {
            switch style {
            case .list:
                tableView?.rowHeight = 90
            case .image:
                tableView?.rowHeight = 110
            }
        }
    }

    var accounts: [Account] = []
    weak var tableView: UITableView?
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
        var accountCell: AccountOverviewCellProtocol

        switch self.style {
        case .list:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(AccountOverviewTextCell.self)", for: indexPath
            ) as? AccountOverviewTextCell else {
                fatalError("Failed to dequeue cell")
            }
            accountCell = cell
        case .image:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(AccountOverviewImageCell.self)", for: indexPath
            ) as? AccountOverviewImageCell else {
                fatalError("Failed to dequeue cell")
            }
            accountCell = cell
        }

        let account = accounts[indexPath.row]

//        accountCell.configure(
//            style: style,
//            imageData: ,
//            accountName: account.name,
//            amount: account.amount,
//            availible: account.availible
//        )
        return accountCell
    }
}

extension AccountsScreenTableManager: UITableViewDelegate {

}

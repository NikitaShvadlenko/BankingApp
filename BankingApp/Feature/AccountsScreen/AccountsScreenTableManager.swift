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
    func imageForIndexPath(_ indexPath: IndexPath) -> Data?
}

protocol AccountsScreenTableManagerDelegate: AnyObject {
    func accountsScreenTableManager(
        _ accountsScreenTableManager: ManagesAccountsScreenTable,
        didSelectItemAt indexPath: IndexPath
    )

    func accountsScreenTableManager(
        _ accountsScreenTableManager: ManagesAccountsScreenTable,
        needsImageFor indexPath: IndexPath,
        completion: @escaping (_ imageData: Data) -> Void
    )
}

final class AccountsScreenTableManager: NSObject {
    private var imageWaitingIndexPaths = Set<IndexPath>()
    var accounts: [Account] = []
    weak var tableView: UITableView?
    weak var delegate: AccountsScreenTableManagerDelegate?

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
}

extension AccountsScreenTableManager: ManagesAccountsScreenTable {
    func imageForIndexPath(_ indexPath: IndexPath) -> Data? {
        guard
            let cell = tableView?.cellForRow(at: indexPath) as? AccountOverviewCellProtocol,
            let imageData = cell.accountImageView.image?.pngData()
        else {
            return nil
        }
        return imageData
    }

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
        accountCell.configure(
            accountName: account.name,
            amount: account.amount,
            availible: account.availible
        )
        return accountCell
    }

    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        imageWaitingIndexPaths.insert(indexPath)
        let cell = cell as? AccountOverviewCellProtocol
        delegate?.accountsScreenTableManager(
            self,
            needsImageFor: indexPath,
            completion: { [weak self, weak cell] (imageData: Data) in
                guard self?.imageWaitingIndexPaths.contains(indexPath) == true else { return }
                self?.imageWaitingIndexPaths.remove(indexPath)
                cell?.configureImage(imageData)
            }
        )
    }
}

extension AccountsScreenTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? AccountOverviewCellProtocol else {
            return
        }
        let image = cell.accountImageView.image
        delegate?.accountsScreenTableManager(self, didSelectItemAt: indexPath)
    }
}

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
    var tableView: UITableView? { get set }
    func setAccounts(_ accounts: [ApplicationAccountDescription])
    func toggleFooterNextButton(footerSectionIndex: Int)
}

final class SelectAccountTableViewManager: NSObject {
    var accounts: [ApplicationAccountDescription] = []
    weak var tableView: UITableView?
}

// MARK: - ManagesAccountSelectionTableView
extension SelectAccountTableViewManager: ManagesAccountSelectionTableView {
    func toggleFooterNextButton(footerSectionIndex: Int) {
        guard let footer = tableView?.footerView(forSection: footerSectionIndex) as? ApplyForCardFooterView else {
            return
        }
        footer.toggleNextButton()
    }

    func setAccounts(_ accounts: [ApplicationAccountDescription]) {
        self.accounts = accounts
    }
}

// MARK: - UITableViewDataSource
extension SelectAccountTableViewManager: UITableViewDataSource {
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

// MARK: - UITableViewDelegate
extension SelectAccountTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(SelectAccountTableHeader.self)")
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(ApplyForCardFooterView.self)")
        return view
    }
}

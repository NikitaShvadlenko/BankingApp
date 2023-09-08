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
    func activateFooterNextButton(footerSectionIndex: Int)
    func deactivateFooterNextButton(footerSectionIndex: Int)
}

protocol SelectAccountTableViewDelegate: AnyObject {
    func selectAccountTableManager(
        _ selectAccountTableManager: ManagesAccountSelectionTableView,
        didSelectRowAt indexPath: IndexPath
    )

    func selectAccountTableManager(
        _ selectAccountTableManager: ManagesAccountSelectionTableView,
        didDeselectRowAt indexPath: IndexPath
    )
}

final class SelectAccountTableViewManager: NSObject {
    private var isNextButtonActivated = false {
        didSet {
            guard
                let footerIndex = nextButtonFooterSectionIndex,
                let footerView = tableView?.footerView(forSection: footerIndex) as? ApplyForCardFooterView
            else { return }
            footerView.configure(isButtonActivated: isNextButtonActivated)
        }
    }
    private var nextButtonFooterSectionIndex: Int?
    var accounts: [ApplicationAccountDescription] = []
    weak var tableView: UITableView?
    weak var delegate: SelectAccountTableViewDelegate?
}

// MARK: - ManagesAccountSelectionTableView
extension SelectAccountTableViewManager: ManagesAccountSelectionTableView {
    func activateFooterNextButton(footerSectionIndex: Int) {
        isNextButtonActivated = true
    }

    func deactivateFooterNextButton(footerSectionIndex: Int) {
        isNextButtonActivated = false
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
        guard let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "\(ApplyForCardFooterView.self)"
        ) as? ApplyForCardFooterView else { fatalError("Failed to dequeue cell") }
        view.configure(isButtonActivated: isNextButtonActivated)
        nextButtonFooterSectionIndex = section
        return view
    }

    func tableView(
        _ tableView: UITableView,
        willDisplayFooterView view: UIView,
        forSection section: Int
    ) {
        guard let view = view as? ApplyForCardFooterView else { return }
        view.configure(isButtonActivated: isNextButtonActivated)
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let selectedCell = tableView.cellForRow(at: indexPath) else { return nil }

        if selectedCell.isSelected == true {
            tableView.deselectRow(at: indexPath, animated: true)
            delegate?.selectAccountTableManager(self, didDeselectRowAt: indexPath)
            return nil
        }
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectAccountTableManager(self, didSelectRowAt: indexPath)
    }

}

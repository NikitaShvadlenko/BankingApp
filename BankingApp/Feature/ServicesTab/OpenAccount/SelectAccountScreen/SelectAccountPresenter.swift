//
//  SelectAccountViewPresenter.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class SelectAccountPresenter: SelectAccountViewOutput {
    weak var view: SelectAccountViewInput?

    var accountDescriptionProvider: ProvidesAccountApplicationDescription?
    var tableViewManager: ManagesAccountSelectionTableView?
    weak var selectAccountDelegate: SelectAccountDelegate?

    func viewDidLoad(_ view: SelectAccountViewInput) {
        guard let accounts = accountDescriptionProvider?.fetchApplicationDescription() else {
            return
        }
        tableViewManager?.setAccounts(accounts)

    }
}

// MARK: - SelectAccountTableViewDelegate
extension SelectAccountPresenter: SelectAccountTableViewDelegate {
    func selectAccountTableManager(
        _ selectAccountTableManager: ManagesAccountSelectionTableView,
        didPressNextButton selectedIndex: IndexPath
    ) {
        guard selectedIndex.row <= selectAccountTableManager.accounts.count else { return }
        let item = selectAccountTableManager.accounts[selectedIndex.row]
        selectAccountDelegate?.selectAccountViewDidSelectAccountOption(item)
    }

    func selectAccountTableManager(
        _ selectAccountTableManager: ManagesAccountSelectionTableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        selectAccountTableManager.activateFooterNextButton(footerSectionIndex: indexPath.section)
    }

    func selectAccountTableManager(
        _ selectAccountTableManager: ManagesAccountSelectionTableView,
        didDeselectRowAt indexPath: IndexPath
    ) {
        selectAccountTableManager.deactivateFooterNextButton(footerSectionIndex: indexPath.section)
    }
}

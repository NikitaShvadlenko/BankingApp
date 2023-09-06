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

    func viewDidLoad(_ view: SelectAccountViewInput) {
        guard let accounts = accountDescriptionProvider?.fetchApplicationDescription() else {
            return
        }
        tableViewManager?.setAccounts(accounts)

    }
}

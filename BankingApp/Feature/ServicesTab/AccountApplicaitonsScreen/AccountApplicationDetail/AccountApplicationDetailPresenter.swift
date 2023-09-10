//
//  AccountApplicationDetailPresenter.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class AccountApplicationDetailPresenter {
    var application: AccountApplication?
}

// MARK: - AccountApplicationDetailViewOutput
extension AccountApplicationDetailPresenter: AccountApplicationDetailViewOutput {
    func viewDidLoad(_ view: AccountApplicationDetailViewInput) {
        guard let application else { return }
        let viewModel = viewModel(for: application)
        view.configureViews(with: viewModel)
    }
}

// MARK: - Private Methods
extension AccountApplicationDetailPresenter {
    private func viewModel(for application: AccountApplication) -> AccountApplicationDetailViewModel {
        let viewModel = AccountApplicationDetailViewModel(
            date: application.date,
            accountName: application.accountType,
            reason: application.statusText,
            applicationStatus: application.applicationStatus
        )
        return viewModel
    }
}

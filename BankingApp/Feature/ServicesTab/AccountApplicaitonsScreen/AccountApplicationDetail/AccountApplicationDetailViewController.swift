//
//  AccountApplicationDetailViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationDetailViewController: UIViewController {

    var presenter: AccountApplicationDetailViewOutput?
    let accountApplicationDetailView = AccountApplicationDetailView()

    override func loadView() {
        view = accountApplicationDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

extension AccountApplicationDetailViewController: AccountApplicationDetailViewInput {
    func configureViews(with viewModel: AccountApplicationDetailViewModel) {
        accountApplicationDetailView.configureView(
            accountName: viewModel.accountName,
            date: viewModel.date,
            reason: viewModel.reason,
            applicationStatus: viewModel.applicationStatus
        )
    }
}

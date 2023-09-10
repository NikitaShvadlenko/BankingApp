//
//  AccountApplicationsViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationsViewController: UIViewController {
    var presenter: AccountApplicationsViewOutput?

    private let accountApplicationsView = AccountApplicationsView()

    override func loadView() {
        view = accountApplicationsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - AccountApplicationsViewInput
extension AccountApplicationsViewController: AccountApplicationsViewInput {
    func configureViews() {

    }
}

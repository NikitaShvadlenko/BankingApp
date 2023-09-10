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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func setTableViewManager(_ manager: ManagesAccountApplicationsTable) {
        accountApplicationsView.tableView.dataSource = manager
        accountApplicationsView.tableView.delegate = manager
    }
}

// MARK: - AccountApplicationsViewInput
extension AccountApplicationsViewController: AccountApplicationsViewInput {
    func setApplications() {
        accountApplicationsView.tableView.reloadData()
    }

    func configureViews() {

    }
}

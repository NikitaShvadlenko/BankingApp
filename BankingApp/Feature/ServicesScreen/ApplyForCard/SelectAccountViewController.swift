//
//  ApplyForCardViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class SelectAccountViewController: FormViewController {

    var presenter: SelectAccountViewOutput?
    weak var coordinator: Coordinator?
    let selectAccountView = ChooseAccountView()

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = selectAccountView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        title = L10n.Application.applicationForm
    }

    func setTableViewManager(_ manager: ManagesAccountSelectionTableView) {
        selectAccountView.tableView.delegate = manager
        selectAccountView.tableView.dataSource = manager
    }
}

// MARK: - SelectAccountViewInput
extension SelectAccountViewController: SelectAccountViewInput {
    func configureViews() {
        selectAccountView.tableView.reloadData()
    }
}

// MARK: - Coordinating
extension SelectAccountViewController: Coordinating {
    func setViewController(selectedPageNumber: Int, numberOfPages: Int) {
        selectAccountView.configureView(
            title: L10n.Application.openAnAccount,
            pageNumber: selectedPageNumber,
            totalPages: numberOfPages,
            pageTitle: L10n.Application.chooseAnAccount
        )
    }
}

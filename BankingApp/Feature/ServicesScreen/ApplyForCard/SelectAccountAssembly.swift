//
//  SelectAccountAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum SelectAccountAssembly {
    static func assemble(coordinator: Coordinator) -> UIViewController {
        let tableViewManager = SelectAccountTableViewManager()
        let presenter = SelectAccountPresenter()
        let accountsDescriptionProvider = ApplicationAccountDescriptionProvider()
        let viewController = SelectAccountViewController(coordinator: coordinator)
        presenter.view = viewController
        viewController.presenter = presenter
        viewController.setTableViewManager(tableViewManager)
        presenter.tableViewManager = tableViewManager
        presenter.accountDescriptionProvider = accountsDescriptionProvider
        return viewController
    }
}

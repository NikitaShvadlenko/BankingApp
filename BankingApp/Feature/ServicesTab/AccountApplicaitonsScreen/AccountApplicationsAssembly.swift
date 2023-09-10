//
//  AccountApplicationsAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum AccountApplicationsAssembly {
    static func assemble() -> UIViewController {
        let viewController = AccountApplicationsViewController()
        let presenter = AccountApplicationsPresenter()
        let interactor = AccountApplicationsInteractor()
        let router = AccountApplicationsRouter()

        let tableManager = AccountApplicationsTableViewManager()
        let context = CoreDataService.shared.context

        tableManager.delegate = presenter
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter

        interactor.context = context
        presenter.applicationsTableManager = tableManager
        viewController.setTableViewManager(tableManager)
        return viewController
    }
}

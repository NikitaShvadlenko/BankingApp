//
//  AccountApplicationsRouter.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationsRouter {
    weak var viewController: UIViewController?
}

// MARK: - AccountApplicationsRouterInput
extension AccountApplicationsRouter: AccountApplicationsRouterInput {
    func routeToDetailView(application: AccountApplication) {
        let applicationDetailViewController = AccountApplicationDetailViewAssembly.assemble(application: application)
        viewController?.navigationController?.pushViewController(applicationDetailViewController, animated: true)
    }
}

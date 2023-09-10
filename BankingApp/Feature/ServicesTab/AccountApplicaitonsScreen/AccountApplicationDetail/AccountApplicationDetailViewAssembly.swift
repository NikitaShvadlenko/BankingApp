//
//  AccountApplicationDetailViewAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum AccountApplicationDetailViewAssembly {
    static func assemble(application: AccountApplication) -> UIViewController {
        let viewController = AccountApplicationDetailViewController()
        let presenter = AccountApplicationDetailPresenter()
        viewController.presenter = presenter
        presenter.application = application
        return viewController
    }
}

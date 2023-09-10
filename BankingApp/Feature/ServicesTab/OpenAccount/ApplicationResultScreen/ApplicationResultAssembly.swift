//
//  ApplicationResultAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum ApplicationResultAssembly {
    static func assemble(
        coordinator: OpenAccountCoordinator,
        delegate: ApplicationResultDelegate
    ) -> CoordinatorItem {

        let viewController = ApplicationResultViewController()
        viewController.coordinator = coordinator
        viewController.delegate = delegate
        viewController.setApplicationResultViewDelegate(delegate: viewController)
        return viewController
    }
}

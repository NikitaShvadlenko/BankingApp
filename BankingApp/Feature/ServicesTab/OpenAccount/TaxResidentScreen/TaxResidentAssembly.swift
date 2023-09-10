//
//  TaxResidentAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum TaxResidentAssembly {
    static func assemble(
        coordinator: OpenAccountCoordinator,
        delegate: TaxResidentDelegate
    ) -> OpenAccountCoordinatorItem {
        let viewController = TaxResidentViewController()
        viewController.setTaxResidentViewDelegate(viewController)
        viewController.coordinator = coordinator
        viewController.delegate = delegate
        return viewController
    }
}

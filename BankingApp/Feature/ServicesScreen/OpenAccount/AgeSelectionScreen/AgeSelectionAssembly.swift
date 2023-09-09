//
//  AgeSelectionAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum AgeSelectionAssembly {
    static func assemble(
        coordinator: OpenAccountCoordinator,
        delegate: AgeSelectionDelegate
    ) -> OpenAccountCoordinatorItem {
        let viewController = AgeSelectionViewController()
        viewController.coordinator = coordinator
        viewController.delegate = delegate
        return viewController
    }
}

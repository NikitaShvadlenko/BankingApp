//
//  ReviewAccountApplicationAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum ReviewAccountApplicationAssembly {
    static func assemble(
        coordinator: OpenAccountCoordinator,
        delegate: ReviewAccountApplicationDelegate,
        dateOfBirth: Date,
        taxDetails: String,
        accountName: String
    ) -> OpenAccountCoordinatorItem {
        let viewController = ReviewAccountApplicationViewController(
            accountName: accountName,
            taxResidencyStatus: taxDetails,
            dateOfBirth: dateOfBirth
        )
        viewController.coordinator = coordinator
        viewController.delegate = delegate
        return viewController
    }
}

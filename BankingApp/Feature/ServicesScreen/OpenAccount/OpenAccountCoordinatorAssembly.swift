//
//  OpenAccountCoordinatorAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum OpenAccountCoordinatorAssembly {
    static func assemble(parentViewController: UIViewController) -> Coordinator {
        let coordinator = OpenAccountCoordinator(parentViewController: parentViewController)
        let interactor = OpenAccountInteractor()
        let builder = OpenAccountBuilder()
        let context = CoreDataService.shared.context
        interactor.builder = builder
        interactor.context = context
        interactor.coordinator = coordinator
        coordinator.interactor = interactor
        return coordinator
    }
}

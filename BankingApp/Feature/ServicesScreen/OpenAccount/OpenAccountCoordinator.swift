//
//  ServicesCoordinator.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class OpenAccountCoordinator: Coordinator {

    var parentViewController: UIViewController
    var interactor: OpenAccountInteractorInput?

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }

    func start() {
        let selectAccountViewController = SelectAccountAssembly.assemble(
            coordinator: self,
            delegate: self
        )
        selectAccountViewController.setViewController(selectedPageNumber: 1, numberOfPages: 3)
        parentViewController.navigationController?.pushViewController(selectAccountViewController, animated: true)
    }
}

// MARK: - OpenAccountInteractorOutput
extension OpenAccountCoordinator: OpenAccountInteractorOutput {
    func interactorDidSetAccountDetails() {
        let viewController = TaxResidentAssembly.assemble()
        viewController.setViewController(selectedPageNumber: 2, numberOfPages: 3)
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - SelectAccountDelegate
extension OpenAccountCoordinator: SelectAccountDelegate {
    func selectAccountViewDidSelectAccountOption(_ accountOption: ApplicationAccountDescription) {
        interactor?.addAccountDetails(accountOption)
    }
}

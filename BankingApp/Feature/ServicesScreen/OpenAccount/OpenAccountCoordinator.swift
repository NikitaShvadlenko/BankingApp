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
    func interactorDidSetAge() {
        let viewController = UIViewController()
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }

    func interactorDidSetTaxResidency() {
        let viewController = AgeSelectionAssembly.assemble(coordinator: self, delegate: self)
        viewController.setViewController(selectedPageNumber: 3, numberOfPages: 3)
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }

    func interactorDidSetAccountDetails() {
        let viewController = TaxResidentAssembly.assemble(
            coordinator: self,
            delegate: self
        )
        viewController.setViewController(selectedPageNumber: 2, numberOfPages: 3)
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - AgeSelectionDelegate
extension OpenAccountCoordinator: AgeSelectionDelegate {
    func viewDidSelectDateOfBirth(_ view: AgeSelectionViewController, dateOfBirth: Date) {
        interactor?.addDateOfBirth(dateOfBirth)
    }
}

// MARK: - TaxResidentDelegate
extension OpenAccountCoordinator: TaxResidentDelegate {
    func taxResidentView(_ taxResidentView: TaxResidentViewController, didSelectOption option: SelectionViewOption) {
        interactor?.addTaxResidentStatus(option.rawValue)
    }
}

// MARK: - SelectAccountDelegate
extension OpenAccountCoordinator: SelectAccountDelegate {
    func selectAccountViewDidSelectAccountOption(_ accountOption: ApplicationAccountDescription) {
        interactor?.addAccountDetails(accountOption)
    }
}

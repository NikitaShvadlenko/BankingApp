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
    var totalNumberOfPages = 4

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }

    func start() {
        let selectAccountViewController = SelectAccountAssembly.assemble(
            coordinator: self,
            delegate: self
        )
        selectAccountViewController.setViewController(selectedPageNumber: 1, numberOfPages: totalNumberOfPages)
        parentViewController.navigationController?.pushViewController(selectAccountViewController, animated: true)
    }
}

// MARK: - OpenAccountInteractorOutput
extension OpenAccountCoordinator: OpenAccountInteractorOutput {
    func interactorDidSaveApplication(
        _ interactor: OpenAccountInteractorInput,
        result: Result<AccountApplicationForm, Error>
    ) {
        switch result {
        case .success:
            print("Success!")
        case .failure(let error):
            print(error)
        }
    }

    func interactorDidFetchAccountReviewDetails(
        _ interactor: OpenAccountInteractorInput,
        dateOfBirth: Date,
        taxDetails: String,
        accountName: String
    ) {
        let viewController = ReviewAccountApplicationAssembly.assemble(
            coordinator: self,
            delegate: self,
            dateOfBirth: dateOfBirth,
            taxDetails: taxDetails,
            accountName: accountName
        )
        viewController.setViewController(selectedPageNumber: 4, numberOfPages: totalNumberOfPages)
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }

    func interactorDidSetAge(_ interactor: OpenAccountInteractorInput) {
        interactor.fetchApplicationDetails()
    }

    func interactorDidSetTaxResidency(_ interactor: OpenAccountInteractorInput) {
        let viewController = AgeSelectionAssembly.assemble(coordinator: self, delegate: self)
        viewController.setViewController(selectedPageNumber: 3, numberOfPages: totalNumberOfPages)
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }

    func interactorDidSetAccountDetails(_ interactor: OpenAccountInteractorInput) {
        let viewController = TaxResidentAssembly.assemble(
            coordinator: self,
            delegate: self
        )
        viewController.setViewController(selectedPageNumber: 2, numberOfPages: totalNumberOfPages)
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - ReviewAccountApplicationDelegate
extension OpenAccountCoordinator: ReviewAccountApplicationDelegate {
    func reviewAccountApplicationView(_ view: ReviewAccountApplicationViewController, didReviewTerms didAccept: Bool) {
        interactor?.saveApplication()
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

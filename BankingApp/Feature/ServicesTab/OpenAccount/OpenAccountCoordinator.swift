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
    func interactorDidFetchAccountReviewDetails(with error: Error) {
        handleError(error: error)
    }

    func interactorDidSaveApplication(
        _ interactor: OpenAccountInteractorInput,
        result: Result<AccountApplicationForm, Error>
    ) {
        switch result {
        case .success:
            let viewController = ApplicationResultAssembly.assemble(coordinator: self, delegate: self)
            parentViewController.navigationController?.pushViewController(viewController, animated: true)
        case .failure(let error):
            handleError(error: error)
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
// MARK: - ApplicationResultDelegate
extension OpenAccountCoordinator: ApplicationResultDelegate {
    func viewDidSelectViewApplications(_ view: ApplicationResultViewController) {
        let viewController = AccountApplicationsAssembly.assemble()
        parentViewController.navigationController?.setViewControllers(
            [
                parentViewController,
                viewController
            ],
            animated: true
        )
    }

    func viewDidSelectComplete(_ view: ApplicationResultViewController) {
        parentViewController.navigationController?.dismiss(animated: true)
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

// MARK: - Private methods
extension OpenAccountCoordinator {
    private func presentErrorAlert(alertTitle: String, alertMessage: String) {
        let alertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: L10n.ApplicationBuildError.ok,
            style: .cancel
        )

        alertController.addAction(action)
        parentViewController.present(alertController, animated: true)
    }

    private func handleError(error: Error) {
        guard let builderError = error as? OpenAccountBuilder.OpenAccountBuilderError else {
            presentErrorAlert(
                alertTitle: L10n.ApplicationBuildError.title,
                alertMessage: L10n.ApplicationBuildError.unknownError(error.localizedDescription)
            )
            return
        }

        switch builderError {
        case .fieldsNotFilled:
            presentErrorAlert(
                alertTitle: L10n.ApplicationBuildError.title,
                alertMessage: L10n.ApplicationBuildError.fieldsNotFilled
            )
        case .invalidDateOfBirth:
            presentErrorAlert(
                alertTitle: L10n.ApplicationBuildError.title,
                alertMessage: L10n.ApplicationBuildError.incorrectDate
            )
        }
    }
}

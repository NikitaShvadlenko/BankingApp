//
//  AccountApplicationsPresenter.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class AccountApplicationsPresenter {
    weak var view: AccountApplicationsViewInput?
    var interactor: AccountApplicationsInteractorInput?
    var applicationsTableManager: ManagesAccountApplicationsTable?
    var router: AccountApplicationsRouterInput?
}

// MARK: - AccountApplicationsTableManagerDelegate
extension AccountApplicationsPresenter: AccountApplicationsTableManagerDelegate {
    func accountApplicationsTableManager(
        _ manager: ManagesAccountApplicationsTable,
        didSelectRowAt indexPath: IndexPath
    ) {
        let application = manager.applications[indexPath.row]
        router?.routeToDetailView(application: application)
    }
}

// MARK: - AccountApplicationsViewOutput
extension AccountApplicationsPresenter: AccountApplicationsViewOutput {
    func viewDidLoad(_ view: AccountApplicationsViewInput) {
        interactor?.fetchAccountApplications()
        view.configureViews()
    }
}

// MARK: - AccountApplicationsInteractorOutput
extension AccountApplicationsPresenter: AccountApplicationsInteractorOutput {
    func interactor(
        _ interactor: AccountApplicationsInteractorInput,
        didFetchApplications result: Result<[AccountApplication], Error>
    ) {
        switch result {
        case .success(let applications):
            applicationsTableManager?.setApplications(applications)
        case .failure(let error):
            print(error)
        }
    }
}

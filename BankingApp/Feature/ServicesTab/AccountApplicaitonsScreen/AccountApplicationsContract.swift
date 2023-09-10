//
//  AccountApplicationsContract.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol AccountApplicationsViewInput: AnyObject {
    func configureViews()
    func setApplications()
}

protocol AccountApplicationsViewOutput {
    func viewDidLoad(_ view: AccountApplicationsViewInput)
}

protocol AccountApplicationsInteractorInput {
    func fetchAccountApplications()
}

protocol AccountApplicationsInteractorOutput: AnyObject {
    func interactor(
        _ interactor: AccountApplicationsInteractorInput,
        didFetchApplications result: Result<[AccountApplication], Error> 
    )
}

protocol AccountApplicationsRouterInput {
    func routeToDetailView(application: AccountApplication)
}

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
    
}

extension AccountApplicationsPresenter: AccountApplicationsViewOutput {
    func viewDidLoad(_ view: AccountApplicationsViewInput) {
        view.configureViews()
    }

}

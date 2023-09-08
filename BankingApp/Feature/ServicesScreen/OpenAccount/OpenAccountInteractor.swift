//
//  OpenAccountInteractor.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class OpenAccountInteractor {
    weak var coordinator: OpenAccountInteractorOutput?
    var builder: BuildsAccountApplication?
}

extension OpenAccountInteractor: OpenAccountInteractorInput {
    func addAccountDetails(_ accountDetails: ApplicationAccountDescription) {
        builder?.setMonthlyFee(accountDetails.monthlyFee)
        builder?.setAccountType(accountDetails.accountName)
        coordinator?.interactorDidSetAccountDetails()
    }

    func saveApplication() {
    }
}

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
    func fetchApplicationDetails() {
        guard
        let dateOfBirth = builder?.dateOfBirth,
        let isTaxResident = builder?.isTaxResident,
        let accountName = builder?.accountType
        else {
            return
        }
        var taxDetails: String
        taxDetails = isTaxResident ? L10n.ApplicationReview.resident : L10n.ApplicationReview.notResident
        coordinator?.interactorDidFetchAccountReviewDetails(
            dateOfBirth: dateOfBirth,
            taxDetails: taxDetails,
            accountName: accountName
        )
    }

    func addDateOfBirth(_ dateOfBirth: Date) {
        builder?.setDateOfBirth(dateOfBirth)
        coordinator?.interactorDidSetAge()
    }

    func addTaxResidentStatus(_ isTaxResident: Bool) {
        builder?.setResidencyStatus(isTaxResident)
        coordinator?.interactorDidSetTaxResidency()
    }

    func addAccountDetails(_ accountDetails: ApplicationAccountDescription) {
        builder?.setMonthlyFee(accountDetails.monthlyFee)
        builder?.setAccountType(accountDetails.accountName)
        coordinator?.interactorDidSetAccountDetails()
    }

    func saveApplication() {
    }
}

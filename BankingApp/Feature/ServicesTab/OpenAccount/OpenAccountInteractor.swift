//
//  OpenAccountInteractor.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation
import CoreData

final class OpenAccountInteractor {
    weak var coordinator: OpenAccountInteractorOutput?
    var builder: BuildsAccountApplication?
    var context: NSManagedObjectContext?
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
            self,
            dateOfBirth: dateOfBirth,
            taxDetails: taxDetails,
            accountName: accountName
        )
    }

    func addDateOfBirth(_ dateOfBirth: Date) {
        builder?.setDateOfBirth(dateOfBirth)
        coordinator?.interactorDidSetAge(self)
    }

    func addTaxResidentStatus(_ isTaxResident: Bool) {
        builder?.setResidencyStatus(isTaxResident)
        coordinator?.interactorDidSetTaxResidency(self)
    }

    func addAccountDetails(_ accountDetails: ApplicationAccountDescription) {
        builder?.setMonthlyFee(accountDetails.monthlyFee)
        builder?.setAccountType(accountDetails.accountName)
        coordinator?.interactorDidSetAccountDetails(self)
    }

    func saveApplication() {
        guard
            let builder,
            let context
        else { return }
        do {
            let applicationForm = try builder.build()
            let applicationStatus: ApplicationStatus
            var statusText: String?

            switch applicationForm.status {
            case .failed(let reason):
                applicationStatus = .failed
                statusText = reason
            case .success:
                applicationStatus = .success
            }

            AccountApplication.insert(
                into: context,
                accountType: applicationForm.accountType,
                monthlyFee: applicationForm.monthlyFee,
                applicationStatus: applicationStatus,
                statusText: statusText
            )
            coordinator?.interactorDidSaveApplication(self, result: .success(applicationForm))
        } catch {
            coordinator?.interactorDidSaveApplication(self, result: .failure(error))
        }

    }
}

//
//  OpenAccountContract.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol OpenAccountInteractorInput {
    func addAccountDetails(_ accountDetails: ApplicationAccountDescription)
    func addTaxResidentStatus(_ isTaxResident: Bool)
    func addDateOfBirth(_ dateOfBirth: Date)
    func saveApplication()
    func fetchApplicationDetails()
}

protocol OpenAccountInteractorOutput: AnyObject {
    func interactorDidSetAccountDetails(_ interactor: OpenAccountInteractorInput)
    func interactorDidSetTaxResidency(_ interactor: OpenAccountInteractorInput)
    func interactorDidSetAge(_ interactor: OpenAccountInteractorInput)
    func interactorDidFetchAccountReviewDetails(
        _ interactor: OpenAccountInteractorInput,
        dateOfBirth: Date,
        taxDetails: String,
        accountName: String
    )

    func interactorDidSaveApplication(
        _ interactor: OpenAccountInteractorInput,
        result: Result<AccountApplicationForm, Error>
    )
}

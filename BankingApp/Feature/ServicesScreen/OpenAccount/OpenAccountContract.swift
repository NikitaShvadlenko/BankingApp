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
    func interactorDidSetAccountDetails()
    func interactorDidSetTaxResidency()
    func interactorDidSetAge()
    func interactorDidFetchAccountReviewDetails(dateOfBirth: Date, taxDetails: String, accountName: String)
}

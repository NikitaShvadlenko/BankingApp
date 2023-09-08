//
//  OpenAccountBuilder.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol BuildsAccountApplication {
    var accountType: String? { get }
    var monthlyFee: Double? { get }
    var isTaxResident: Bool? { get }
    var dateOfBirth: Date? { get }

    func setAccountType(_ accountType: String)
    func setMonthlyFee(_ monthlyFee: Double)
    func setResidencyStatus(_ status: Bool)
    func setDateOfBirth(_ dateOfBirth: Date)
    func build() throws -> AccountApplicationForm
}

final class OpenAccountBuilder: BuildsAccountApplication {

    enum OpenAccountBuilderError: Error {
        case fieldsNotFilled
        case invalidDateOfBirth
    }

    var isTaxResident: Bool?

    var dateOfBirth: Date?

    var accountType: String?

    var monthlyFee: Double?

    func setResidencyStatus(_ status: Bool) {
        self.isTaxResident = status
    }

    func setDateOfBirth(_ dateOfBirth: Date) {
        self.dateOfBirth = dateOfBirth
    }

    func setAccountType(_ accountType: String) {
        self.accountType = accountType
    }

    func setMonthlyFee(_ monthlyFee: Double) {
        self.monthlyFee = monthlyFee
    }

    func build() throws -> AccountApplicationForm {
        guard
            let isTaxResident,
            let dateOfBirth,
            let accountType,
            let monthlyFee
        else {
            throw OpenAccountBuilderError.fieldsNotFilled
        }
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        guard let age = ageComponents.year else {
            throw OpenAccountBuilderError.invalidDateOfBirth
        }
        var applicationStatus: AccountApplicationStatus
        switch (isTaxResident, age > 18) {
        case (true, true):
            applicationStatus = .success
        case (false, true):
            applicationStatus = .failed(reason: L10n.ApplicationResult.notResident)
        case (true, false):
            applicationStatus = .failed(reason: L10n.ApplicationResult.underaged(18))
        case (false, false):
            applicationStatus = .failed(reason: L10n.ApplicationResult.underagedAndNotResident(18))
        }

        let accountApplicationForm = AccountApplicationForm(
            status: applicationStatus,
            accountType: accountType,
            monthlyFee: monthlyFee
        )
        return accountApplicationForm
    }
}

//
//  OpenAccountInteractor.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol OpenAccountInteractorProtocol {
    func addAccountDetails(_ accountDetails: ApplicationAccountDescription)
    func saveApplication()
}

final class OpenAccountInteractor {

}

extension OpenAccountInteractor: OpenAccountInteractorProtocol {
    func addAccountDetails(_ accountDetails: ApplicationAccountDescription) {

    }

    func saveApplication() {

    }
}

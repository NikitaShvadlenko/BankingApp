//
//  AccountApplicationsInteractor.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation
import CoreData

final class AccountApplicationsInteractor {
    var context: NSManagedObjectContext?
    weak var presenter: AccountApplicationsInteractorOutput?
}

extension AccountApplicationsInteractor: AccountApplicationsInteractorInput {
    func fetchAccountApplications() {
        guard let context else { return }
        let fetchRequest = AccountApplication.sortedFetchRequest
        do {
            let applications = try context.fetch(fetchRequest)
            presenter?.interactor(self, didFetchApplications: .success(applications))
        } catch {
            presenter?.interactor(self, didFetchApplications: .failure(error))
        }
    }
}

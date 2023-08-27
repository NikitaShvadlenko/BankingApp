//
//  AccountsProvider.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit
import FirebaseFirestore

struct AccountsProvider: ProvidesAccounts {
    enum AccountsProviderError: Error {
        case documentNotFound
        case snapshotNotCreated
    }
     func fetchUserDetails(
        for name: String,
        completion: @escaping (Result<[Account], Error>) -> Void
    ) {
        var accounts = [Account]()
        let accountsReference = Firestore.firestore().collection("/users/Jake Smith/accounts")
        accountsReference.getDocuments { snapshot, _ in
            guard let snapshot = snapshot else {
                completion(.failure(AccountsProviderError.snapshotNotCreated))
                return
            }
            for document in snapshot.documents {
                let data = document.data()
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let accountData = try decoder.decode(Account.self, from: jsonData)
                    accounts.append(accountData)
                } catch {
                    completion(.failure(error))
                    return
                }
            }
            completion(.success(accounts))
        }
    }
}

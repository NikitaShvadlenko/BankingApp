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
    }
     func fetchUserDetails(
        for name: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        let accountsReference = Firestore.firestore().collection(FirebaseCollectionKeys.users.rawValue).document(name)
        accountsReference.getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let document = document, document.exists {
                    do {
                        let jsonData = try JSONSerialization.data(
                            withJSONObject: document.data() as Any,
                            options: []
                        )
                        let decoder = JSONDecoder()
                        let user = try decoder.decode(User.self, from: jsonData)
                        completion(.success(user))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(AccountsProviderError.documentNotFound))
                }
            }
        }
    }
}

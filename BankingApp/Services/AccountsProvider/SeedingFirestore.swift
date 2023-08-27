//
//  SeedingFirestore.swift
//  BankingApp
//
//  Created by Nikita Shvad on 27.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Firebase
import Foundation

class SeedingFirestore {
    static func seed() {

        // Access Firestore
        let db = Firestore.firestore()

        // Path to your JSON file
        if let path = Bundle.main.path(forResource: "AccountData", ofType: "json") {
            do {
                // Read JSON file
                let data = try Data(contentsOf: URL(fileURLWithPath: path))

                // Parse JSON
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let name = json["name"] as? String,
                       let accounts = json["accounts"] as? [[String: Any]] {

                        // Create a new document for the user
                        let userDocument = db.collection("users").document(name)

                        // Write user's data to Firestore
                        userDocument.setData(["name": name]) { error in
                            if let error = error {
                                print("Error writing user document: \(error)")
                            } else {
                                print("User document successfully written!")
                            }
                        }

                        // Process accounts and transactions
                        for account in accounts {
                            if let accountName = account["name"] as? String,
                               let transactions = account["transactions"] as? [[String: Any]] {

                                // Create a new collection for the user's accounts
                                let accountCollection = userDocument.collection("accounts").document(accountName)

                                // Write account data to Firestore
                                accountCollection.setData(account) { error in
                                    if let error = error {
                                        print("Error writing account document: \(error)")
                                    } else {
                                        print("Account document successfully written!")
                                    }
                                }

                                // Process transactions
                                for transaction in transactions {
                                    // Write transaction data to Firestore
                                    accountCollection.collection("transactions").addDocument(data: transaction) { error in
                                        if let error = error {
                                            print("Error writing transaction document: \(error)")
                                        } else {
                                            print("Transaction document successfully written!")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } catch {
                print("Error reading or parsing JSON file: \(error)")
            }
        }

    }
}

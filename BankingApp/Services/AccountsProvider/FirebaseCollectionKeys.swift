//
//  FirebaseCollectionKeys.swift
//  BankingApp
//
//  Created by Nikita Shvad on 27.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum FirebaseCollectionKeys {
    case transactions(name: String)

    var key: String {
        switch self {
        case .transactions(let name):
            return "/users/\(name)/accounts"
        }
    }
}

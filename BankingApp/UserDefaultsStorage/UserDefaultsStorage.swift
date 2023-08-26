//
//  UserDefaultsStorage.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class UserDefaultsStorage {
    let storage = UserDefaults.standard
}

extension UserDefaultsStorage: ManagesUserDefaults {
    func saveAccountDisplayStyle(_ style: AccountDisplayStyle) {
        storage.set(style, forKey: UserDefaults.Keys.accountDisplayStyle.rawValue)
    }

    func retrieveAccountDisplayStyle() -> AccountDisplayStyle? {
        storage.object(forKey: UserDefaults.Keys.accountDisplayStyle.rawValue) as? AccountDisplayStyle
    }
}

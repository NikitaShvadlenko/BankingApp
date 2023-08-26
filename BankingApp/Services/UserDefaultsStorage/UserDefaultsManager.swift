//
//  UserDefaultsStorage.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class UserDefaultsManager {
    let storage = UserDefaults.standard
    let accountDisplayStyles = AccountDisplayStyle.allCases
}

extension UserDefaultsManager: ManagesUserSettings {
    func nextAccountDisplayStyle() throws -> AccountDisplayStyle {
        guard !accountDisplayStyles.isEmpty else {
            throw UserSettingManagerError.noAccountStyles
        }
        do {
            let style = try retrieveAccountDisplayStyle()
            guard let nextStyle = accountDisplayStyle(after: style) else {
                throw UserSettingManagerError.failedToRetrieveItem
            }
            saveAccountDisplayStyle(nextStyle)
            return nextStyle
        } catch {
            guard accountDisplayStyles.count >= 2 else {
                return accountDisplayStyles[0]
            }
             let style = accountDisplayStyles[1]
            saveAccountDisplayStyle(style)
            return style
        }
    }

    func saveAccountDisplayStyle(_ style: AccountDisplayStyle) {
        if let encodedStyle = try? JSONEncoder().encode(style) {
            storage.set(
                encodedStyle,
                forKey: UserDefaults.Keys.accountDisplayStyle.rawValue
            )
        }
    }

    func retrieveAccountDisplayStyle() throws -> AccountDisplayStyle {
        guard let styleData = storage.object(
            forKey: UserDefaults.Keys.accountDisplayStyle.rawValue
        ) as? Data else {
            throw UserSettingManagerError.failedToRetrieveItem
        }
        do {
            let style = try JSONDecoder().decode(AccountDisplayStyle.self, from: styleData)
            return style
        } catch {
            throw UserSettingManagerError.failedToRetrieveItem
        }
    }
}

// MARK: - Private Methods
extension UserDefaultsManager {
   private func accountDisplayStyle(after style: AccountDisplayStyle) -> AccountDisplayStyle? {
        guard var accountIndex = accountDisplayStyles.firstIndex(of: style) else {
            return nil
        }
        accountIndex += 1
        if accountIndex >= accountDisplayStyles.count {
            accountIndex = 0
        }
       return accountDisplayStyles[accountIndex]
    }
}

//
//  ManagesUserDefaults.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol ManagesUserSettings {
    func saveAccountDisplayStyle(_ style: AccountDisplayStyle)
    func retrieveAccountDisplayStyle() throws -> AccountDisplayStyle
    func nextAccountDisplayStyle() throws -> AccountDisplayStyle
}

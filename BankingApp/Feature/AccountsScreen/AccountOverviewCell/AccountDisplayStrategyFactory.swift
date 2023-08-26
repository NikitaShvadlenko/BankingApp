//
//  AccountDisplayStrategyFactory.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum AccountDisplayStrategyFactory {
    static func strategy(for style: AccountDisplayStyle) -> AccountOverviewDisplayStrategy {
        switch style {
        case .list:
            return   AccountOverviewTextStrategy()
        case .image:
            return AccountOverviewImageStrategy()
        }
    }
}

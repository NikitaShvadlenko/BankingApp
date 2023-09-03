//
//  AccountOverviewCellFactory.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum AccountOverviewCellFactory {
    static func strategy(for style: AccountDisplayStyle) -> AccountOverviewCellProtocol {
        switch style {
        case .list:
            return   AccountOverviewTextCell()
        case .image:
            return AccountOverviewImageCell()
        }
    }
}

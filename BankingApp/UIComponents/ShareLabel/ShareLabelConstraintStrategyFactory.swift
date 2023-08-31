//
//  ShareLabelConstraintStrategyFactory.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

enum ShareLabelConstraintStrategyFactory {
    static func strategy(for style: ShareLabel.Style) -> ShareLabelConstraintStrategy {
        switch style {
        case .imageFirst:
            return ImageFirstConstraintStrategy()

        case .labelFirst:
            return LabelFirstConstraintStrategy()
        }
    }
}

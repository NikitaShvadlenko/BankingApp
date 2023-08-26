//
//  AccountOverviewStrategy.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol AccountOverviewDisplayStrategy {
    func setupView(
        contentView: UIView,
        accountImageView: UIView,
        accountNameLabel: UILabel,
        amountLabel: UILabel,
        availiableLabel: UILabel
    )
}

//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 27.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol AccountOverviewCellProtocol: UITableViewCell {
    func configure(
        style: AccountDisplayStyle,
        imageData: Data,
        accountName: String,
        amount: Double,
        availible: Double
    )
}

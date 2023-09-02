//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 27.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol AccountOverviewCellProtocol: UITableViewCell {
    var accountNameLabel: UILabel { get }
    var amountLabel: UILabel { get }
    var availibleLabel: UILabel { get }
    var accountImageView: UIImageView { get }

    func configure(
        accountName: String,
        amount: Double,
        availible: Double
    )

    func configureImage(_ imageData: Data)
}

// MARK: - Public Methods
extension AccountOverviewCellProtocol {
    func configure(
        accountName: String,
        amount: Double,
        availible: Double
    ) {
        let numberFormatter = NumberFormatter()
        let formattedAmount = numberFormatter.dollarsFromAmount(amount)
        let formattedAvalible = numberFormatter.dollarsFromAmount(availible)
        accountNameLabel.text = accountName
        amountLabel.text = formattedAmount
        availibleLabel.text = L10n.amountAvailible(formattedAvalible)
    }

    func configureImage(_ imageData: Data) {
        let image = UIImage(data: imageData)
        accountImageView.image = image
    }
}

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
        let formattedAmount = String(format: "%.2f", amount)
        let formattedAvalible = String(format: "%.2f", availible)
        accountNameLabel.text = accountName
        amountLabel.text = L10n.amountInDolars(formattedAmount)
        availibleLabel.text = L10n.amountInDolarsAvailible(formattedAvalible)
    }

    func configureImage(_ imageData: Data) {
        let image = UIImage(data: imageData)
        accountImageView.image = image
    }
}

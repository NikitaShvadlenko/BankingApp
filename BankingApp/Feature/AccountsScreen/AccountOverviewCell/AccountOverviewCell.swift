//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountOverviewCell: UITableViewCell {

   private var strategy: AccountOverviewDisplayStrategy? {
        didSet {
            strategy?.setupView(
                contentView: contentView,
                accountImageView: accountImageView,
                accountNameLabel: accountNameLabel,
                amountLabel: amountLabel,
                availiableLabel: availibleLabel
            )
        }
    }

    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var availibleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

// MARK: - Public Methods
extension AccountOverviewCell {
    func configure(
        style: AccountDisplayStyle,
        imageData: Data,
        accountName: String,
        amount: Double,
        availible: Double
    ) {
        let image = UIImage(data: imageData)
        accountImageView.image = image
        accountNameLabel.text = accountName
        amountLabel.text = L10n.amountInDolars(amount)
        availibleLabel.text = L10n.amountInDolarsAvailible(availible)
        strategy = AccountDisplayStrategyFactory.strategy(for: style)
    }
}

// MARK: - Private Methods
extension AccountOverviewCell {
}

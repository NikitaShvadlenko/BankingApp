//
//  AccountOverviewTextStrategy.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct AccountOverviewTextStrategy: AccountOverviewDisplayStrategy {
    func setupView(
        contentView: UIView,
        accountImageView: UIView,
        accountNameLabel: UILabel,
        amountLabel: UILabel,
        availiableLabel: UILabel
    ) {
        contentView.subviews.forEach({ $0.removeFromSuperview() })

        [
            accountImageView,
            accountNameLabel,
            amountLabel,
            availiableLabel
        ].forEach(contentView.addSubview)

        accountImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.leading.equalToSuperview().inset(14)
            make.top.bottom.equalToSuperview().inset(14)
        }

        accountImageView.layer.cornerRadius = 40

        accountNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.top.equalTo(accountImageView.snp.top)
            make.trailing.equalToSuperview()
        }

        amountLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.bottom.equalTo(accountNameLabel.snp.top)
            make.trailing.equalToSuperview()
        }

        availiableLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.bottom.equalToSuperview()
            make.top.equalTo(amountLabel.snp.bottom)
        }
        configureLabels(accountNameLabel: accountNameLabel, amountLabel: amountLabel, availibleLabel: availiableLabel)
    }
}

// MARK: - Private Methods
extension AccountOverviewTextStrategy {
    private func configureLabels(
        accountNameLabel: UILabel,
        amountLabel: UILabel,
        availibleLabel: UILabel
    ) {
        accountNameLabel.textAlignment = .natural
        amountLabel.textAlignment = .natural
        availibleLabel.textAlignment = .natural

        accountNameLabel.font = UIFont.systemFont(ofSize: 15)
        amountLabel.font = UIFont.systemFont(ofSize: 18)
        availibleLabel.font = UIFont.systemFont(ofSize: 12)

        accountNameLabel.textColor = Asset.Colors.primaryLabel.color
        amountLabel.textColor = Asset.Colors.primaryLabel.color
        availibleLabel.textColor = Asset.Colors.secondaryLabel.color
    }
}

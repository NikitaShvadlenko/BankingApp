//
//  File.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit
import SnapKit

struct AccountOverviewImageStrategy: AccountOverviewDisplayStrategy {
    func setupView(
        contentView: UIView,
        accountImageView: UIView,
        accountNameLabel: UILabel,
        amountLabel: UILabel,
        availiableLabel: UILabel
    ) {
        contentView.subviews.forEach({ $0.removeFromSuperview() })
        contentView.addSubview(accountImageView)
        accountImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(100)
        }

        let containerView = UIView()
        containerView.layer.cornerRadius = 8

        containerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().inset(14)
            make.width.equalTo(contentView.snp.height).multipliedBy(1.5)
        }

        [
            accountNameLabel,
            amountLabel,
            availiableLabel
        ].forEach(contentView.addSubview(_:))

        accountNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(amountLabel.snp.top)
        }

        amountLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        availiableLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(amountLabel.snp.top)
        }

        configureLabels(accountNameLabel: accountNameLabel, amountLabel: amountLabel, availibleLabel: availiableLabel)
    }
}

extension AccountOverviewImageStrategy {
    private func configureLabels(
        accountNameLabel: UILabel,
        amountLabel: UILabel,
        availibleLabel: UILabel
    ) {
        accountNameLabel.textAlignment = .center
        amountLabel.textAlignment = .center
        availibleLabel.textAlignment = .center

        accountNameLabel.font = UIFont.systemFont(ofSize: 16)
        amountLabel.font = UIFont.systemFont(ofSize: 20)
        availibleLabel.font = UIFont.systemFont(ofSize: 12)

        accountNameLabel.textColor = Asset.Colors.primaryLabel.color
        amountLabel.textColor = Asset.Colors.primaryLabel.color
        availibleLabel.textColor = Asset.Colors.secondaryLabel.color
    }
}

//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountOverviewTextCell: UITableViewCell, AccountOverviewCellProtocol {

    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .natural
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .natural
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var availibleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Asset.Colors.secondaryLabel.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

// MARK: - Public Methods
extension AccountOverviewTextCell {
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
    }
}

// MARK: - Private Methods
extension AccountOverviewTextCell {
    private func setupView() {
        [
            accountImageView,
            accountNameLabel,
            amountLabel,
            availibleLabel
        ].forEach(contentView.addSubview)

        accountImageView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(14)
            make.width.equalTo(accountImageView.snp.height)
        }

        accountNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.top.equalTo(accountImageView.snp.top)
            make.trailing.equalToSuperview()
        }

        amountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(accountImageView.snp.centerY)
            make.leading.equalTo(accountImageView.snp.trailing).offset(11)
        }

        availibleLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.bottom.equalTo(accountImageView.snp.bottom)
            make.top.equalTo(amountLabel.snp.bottom)
        }
    }
}

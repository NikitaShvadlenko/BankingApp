//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountOverviewImageCell: UITableViewCell, AccountOverviewCellProtocol {

    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        [
            accountNameLabel,
            amountLabel,
            availibleLabel
        ].forEach(containerView.addSubview(_:))
        return containerView
    }()

    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var availibleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
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
extension AccountOverviewImageCell {
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
extension AccountOverviewImageCell {
    func setupView() {
        contentView.addSubview(accountImageView)
        accountImageView.addSubview(containerView)

        containerView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(accountImageView)
            make.top.equalTo(accountImageView).inset(14)
            make.width.equalTo(accountImageView.snp.height).multipliedBy(1.5)
        }

        accountImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }

        amountLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(containerView)
        }

        accountNameLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.leading.trailing.equalTo(containerView)
            make.bottom.equalTo(amountLabel.snp.top)
        }

        availibleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(amountLabel.snp.bottom)
        }
    }
}

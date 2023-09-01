//
//  TransactionCollectionViewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionCollectionViewCell: UICollectionViewCell {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .natural
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.textAlignment = .natural
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .natural
        return label
    }()

    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .natural
        return label
    }()

    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .natural
        return label
    }()

    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .natural
        return label
    }()

    let shareButton = ShareLabel(style: .imageFirst)

    let firstSectionSeparator = SeparatorView()
    let secondSectionSeparator = SeparatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private Methods
extension TransactionCollectionViewCell {
    private func setupView() {
        [
            nameLabel,
            amountLabel,
            dateLabel,
            typeLabel,
            detailsLabel,
            balanceLabel,
            shareButton,
            firstSectionSeparator,
            secondSectionSeparator
        ].forEach(contentView.addSubview)

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.trailing.equalToSuperview()
        }

        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }

        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        firstSectionSeparator.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
}
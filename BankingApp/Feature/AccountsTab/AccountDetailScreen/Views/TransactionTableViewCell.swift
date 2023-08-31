//
//  TransactionTableViewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 29.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionTableViewCell: UITableViewCell {

    private lazy var accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(sfSymbol: SFSymbol.forward)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Asset.Colors.secondaryLabel.color.withAlphaComponent(0.6)
        return imageView
    }()

    private lazy var transactionNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Asset.Colors.transactionsTableViewLabel.color
        return label
    }()

    private lazy var transactionAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Asset.Colors.transactionsTableViewLabel.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension TransactionTableViewCell {
    public func configure(name: String, amount: Double) {
        var transactionName: String
        if name.isEmpty {
            transactionName = L10n.AccountDetail.anonymous
        } else {
            transactionName = name
        }
        let numberFormatter = NumberFormatter()
        let formattedAmount = numberFormatter.dollarsFromAmount(amount)
        transactionNameLabel.text = transactionName
        transactionAmountLabel.text = formattedAmount
    }
}

// MARK: - Private Methods
extension TransactionTableViewCell {
    private func setupView() {
        [
            transactionNameLabel,
            transactionAmountLabel,
            accessoryImageView
        ].forEach(contentView.addSubview(_:))

        transactionNameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }

        accessoryImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(14)
            make.width.equalTo(accessoryImageView.snp.height)
            make.trailing.equalToSuperview().inset(14)
        }

        transactionAmountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(accessoryImageView.snp.leading)
            make.top.bottom.equalToSuperview()
        }
    }
}

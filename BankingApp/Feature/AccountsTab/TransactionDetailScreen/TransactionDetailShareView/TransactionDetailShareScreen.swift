//
//  TransactionDetailShareView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 02.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionDetailShareView: UIView {

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.anzShareLogo)
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .natural
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 34)
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

    private lazy var processedOnDateLabel: UILabel = {
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

    let bottomSeparatorView = SeparatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension TransactionDetailShareView {
    public func configure(
        with model: TransactionDetailViewModel
    ) {
        let formatter = NumberFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE d MMM yyyy '\(L10n.TransactionDetail.at)' HH:mm"
        nameLabel.text = model.name
        if model.amount > 0 { amountLabel.textColor = Asset.Colors.green.color }
        amountLabel.text = formatter.transactionAmount(model.amount)
        dateLabel.text = dateFormatter.string(from: model.date)
        typeLabel.text = model.type
        processedOnDateLabel.text = L10n.TransactionDetail.processedOn(dateFormatter.string(from: model.dateProcessed))
    }
}

// MARK: - Private Methods
extension TransactionDetailShareView {
    private func setupView() {
        [
            nameLabel,
            amountLabel,
            dateLabel,
            processedOnDateLabel,
            typeLabel,
            bottomSeparatorView,
            logoImageView
        ].forEach(addSubview)
        backgroundColor = Asset.Colors.primaryBackground.color

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }

        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(nameLabel)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(nameLabel)
        }

        processedOnDateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(2)
            make.leading.trailing.equalTo(nameLabel)
        }

        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(processedOnDateLabel.snp.bottom).offset(2)
            make.leading.trailing.equalTo(nameLabel)
        }

        bottomSeparatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(14)
            make.height.equalTo(1)
            make.bottom.equalTo(typeLabel.snp.bottom).offset(15)
        }

        logoImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(250)
        }
    }
}

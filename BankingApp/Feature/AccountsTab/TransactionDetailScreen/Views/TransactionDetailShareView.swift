//
//  TransactionDetailShareView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 02.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionDetailShareView: UIView {

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

    let separatorView = SeparatorView()

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
        amountLabel.text = formatter.dollarsFromAmount(model.amount)
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
            typeLabel
        ].forEach(addSubview)

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
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

        processedOnDateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
        }

        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(processedOnDateLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
        }
    }
}

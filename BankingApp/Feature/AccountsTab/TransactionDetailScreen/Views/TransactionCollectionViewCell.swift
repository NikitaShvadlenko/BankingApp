//
//  TransactionCollectionViewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol TransactionDetailCellDelegate: AnyObject {
    func cellDidTapShareForTransaction(_ transaction: TransactionDetailViewModel)
}

final class TransactionCollectionViewCell: UICollectionViewCell {

    private var transaction: TransactionDetailViewModel?
    weak var delegate: TransactionDetailCellDelegate?

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

    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .natural
        return label
    }()

    private lazy var transactionDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 16)
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

    let shareButton = ShareLabel(style: .imageFirstLeading)

    private let firstSectionSeparator = SeparatorView()
    private let secondSectionSeparator = SeparatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        shareButton.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension TransactionCollectionViewCell {
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
        detailsLabel.text = L10n.TransactionDetail.details
        transactionDetailLabel.text = model.cardNumber
        let formattedBalance = formatter.dollarsFromAmount(model.balanceAfterTransaction)
        balanceLabel.text = L10n.TransactionDetail.balanceAfterTransaction(formattedBalance)
        shareButton.configure(title: L10n.TransactionDetail.share)
        processedOnDateLabel.text = L10n.TransactionDetail.processedOn(dateFormatter.string(from: model.dateProcessed))
        self.transaction = model
    }
}

// MARK: - ShareLabelDelegate
extension TransactionCollectionViewCell: ShareLabelDelegate {
    func shareLabelTapped(shareLabel: ShareLabel) {
        guard let transaction else { return }
        delegate?.cellDidTapShareForTransaction(transaction)
    }
}
// MARK: - Private Methods
extension TransactionCollectionViewCell {
    // swiftlint:disable function_body_length
    private func setupView() {
        [
            nameLabel,
            amountLabel,
            dateLabel,
            typeLabel,
            detailsLabel,
            balanceLabel,
            shareButton,
            processedOnDateLabel,
            transactionDetailLabel,
            firstSectionSeparator,
            secondSectionSeparator
        ].forEach(contentView.addSubview)

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

        firstSectionSeparator.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(14)
            make.height.equalTo(1)
            make.bottom.equalTo(typeLabel.snp.bottom).offset(15)
        }

        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(firstSectionSeparator.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }

        transactionDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(detailsLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
        }

        balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(transactionDetailLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }

        secondSectionSeparator.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(14)
            make.height.equalTo(1)
            make.top.equalTo(balanceLabel.snp.bottom).offset(15)
        }

        shareButton.snp.makeConstraints { make in
            make.top.equalTo(secondSectionSeparator.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.height.equalTo(30)
        }
    }
}

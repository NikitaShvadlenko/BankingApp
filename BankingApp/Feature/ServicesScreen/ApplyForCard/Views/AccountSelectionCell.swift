//
//  AccountSelectionCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountSelectionCell: UITableViewCell {

    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(accountFeeLabel)
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()

    private lazy var interestRatesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(interestRatesLabel)
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()

    private lazy var selectionImage: UIImage = {
        guard let image = UIImage(sfSymbol: SFSymbol.checkmark) else {
            return UIImage()
        }
        return image
    }()

    private lazy var selectionBox: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.tintColor = Asset.Colors.primaryBackground.color
        return view
    }()

    private lazy var accountTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.applicationFormLabel.color
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .natural
        return label
    }()

    private lazy var interestRatesLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.applicationFormLabel.color
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .natural
        label.text = L10n.Application.interestRates
        return label
    }()

    private lazy var accountDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()

    private lazy var accountFeeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()

    private var separatorView = SeparatorView()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionBox.backgroundColor =
        selected ? Asset.Colors.applicationPageViewBackground.color : Asset.Colors.primaryBackground.color
        selectionBox.image = selected ? selectionImage : nil
        contentView.layer.borderWidth = selected ? 2 : 1
        contentView.layer.borderColor =
        selected ? Asset.Colors.secondaryLabel.color.cgColor:
        Asset.Colors.applicationPageViewBackground.color.cgColor
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension AccountSelectionCell {
    public func configure(viewModel: ApplicationAccountDescription) {
        accountTitleLabel.text = viewModel.accountName
        accountDescriptionLabel.text = viewModel.accountDescription
        let fee = Int(viewModel.monthlyFee)
        accountFeeLabel.text = L10n.Application.accountFee(fee)
        configureDescriptions(viewModel: viewModel)
        configureInterestRates(viewModel: viewModel)
    }
}

// MARK: - Private Methods
extension AccountSelectionCell {
    private func setupView() {
        [
            selectionBox,
            accountTitleLabel,
            accountDescriptionLabel,
            accountFeeLabel,
            separatorView,
            descriptionStackView
        ].forEach(contentView.addSubview)

        selectionBox.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(14)
            make.top.equalToSuperview().inset(14)
            make.width.equalTo(30)
            make.height.equalTo(selectionBox.snp.width)
        }

        accountTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(selectionBox.snp.trailing).offset(14)
            make.top.bottom.equalTo(selectionBox)
            make.trailing.equalToSuperview()
        }

        accountDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(accountTitleLabel.snp.bottom).offset(14)
            make.leading.equalTo(selectionBox)
            make.trailing.equalToSuperview()
        }

        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.height.equalTo(1)
        }

        descriptionStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(separatorView)
            make.top.equalTo(separatorView.snp.bottom).offset(14)
            make.bottom.equalToSuperview()
        }

    }

    private func configureDescriptions(viewModel: ApplicationAccountDescription) {
        guard let descriptions = viewModel.descriptionFields else { return }
        for description in descriptions {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = Asset.Colors.primaryLabel.color
            label.text = description
            label.numberOfLines = 0
            descriptionStackView.addArrangedSubview(label)
        }
    }

    private func configureInterestRates(viewModel: ApplicationAccountDescription) {
        guard let rates = viewModel.interestRates else { return }
        for rate in rates {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = Asset.Colors.primaryLabel.color
            label.numberOfLines = 0
            if let upperBound = rate.upperBound {
                label.text =
                L10n.Application.interestRatesBounds(
                    rate.lowerBound, upperBound
                ) + rate.interestDescription
            } else {
                label.text = L10n.Application
                    .interestRatesNoUpperBound(
                        rate.lowerBound
                    ) + rate.interestDescription
            }
            interestRatesStackView.addArrangedSubview(label)
        }
    }
}

//
//  AccountSelectionCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountSelectionCell: UITableViewCell {

    private var isConfigured = false

    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(accountFeeLabel)
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return stackView
    }()

    private lazy var interestRatesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return stackView
    }()

    private lazy var selectionImage: UIImage = {
        guard let image = UIImage(sfSymbol: SFSymbol.checkmark)?.withRenderingMode(.alwaysTemplate) else {
            return UIImage()
        }
        let newSize = CGSize(width: 18, height: 18)
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: newSize))

        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()?.withTintColor(.white) ?? UIImage()
        UIGraphicsEndImageContext()

        return resizedImage
    }()

    private lazy var selectionBox: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.contentMode = .center
        view.tintColor = Asset.Colors.primaryBackground.color
        view.layer.cornerRadius = 15
        return view
    }()

    private lazy var accountTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.applicationFormLabel.color
        label.font = UIFont.systemFont(ofSize: 19)
        label.textAlignment = .natural
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()

    private lazy var interestRatesLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .natural
        label.text = L10n.Application.interestRates
        return label
    }()

    private lazy var accountDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()

    private lazy var accountFeeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryLabel.color
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .natural
        return label
    }()

    private var separatorView = SeparatorView()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionBox.backgroundColor =
        selected ? Asset.Colors.segmentedControlSelector.color : Asset.Colors.primaryBackground.color
        selectionBox.image = selected ? selectionImage : nil
        contentView.layer.borderWidth = selected ? 2 : 1
        contentView.layer.borderColor =
        selected ? Asset.Colors.applicationFormLabel.color.withAlphaComponent(0.8).cgColor :
        Asset.Colors.secondaryLabel.color.cgColor
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        selectionStyle = .none
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
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
        if !isConfigured {
            configureDescriptions(viewModel: viewModel)
            configureInterestRates(viewModel: viewModel)
        }
        isConfigured = true
        layoutIfNeeded()
    }
}

// MARK: - Private Methods
extension AccountSelectionCell {
    private func setupView() {
        [
            selectionBox,
            accountTitleLabel,
            accountDescriptionLabel,
            separatorView,
            descriptionStackView,
            interestRatesStackView
        ].forEach(contentView.addSubview)

        accountFeeLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(16)
        }
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
            make.height.greaterThanOrEqualTo(30)
        }

        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.height.equalTo(1)
            make.top.equalTo(accountDescriptionLabel.snp.bottom).offset(8)
        }

        descriptionStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(separatorView)
            make.top.equalTo(separatorView.snp.bottom).offset(30).priority(.high)
        }

        interestRatesStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionStackView.snp.bottom).offset(14)
            make.leading.trailing.equalTo(separatorView)
            make.bottom.equalToSuperview().inset(10)
        }
    }

    private func configureDescriptions(viewModel: ApplicationAccountDescription) {
        guard let descriptions = viewModel.descriptionFields else { return }
        for description in descriptions {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = Asset.Colors.primaryLabel.color
            label.text = description
            label.numberOfLines = 0
            label.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(16).priority(.high)
            }
            descriptionStackView.addArrangedSubview(label)
        }
    }

    private func configureInterestRates(viewModel: ApplicationAccountDescription) {
        guard let rates = viewModel.interestRates else { return }
        let numbersFormatter = NumberFormatter()
        interestRatesStackView.addArrangedSubview(interestRatesLabel)
        interestRatesLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(16)
        }
        for rate in rates {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = Asset.Colors.primaryLabel.color
            label.numberOfLines = 0
            if let upperBound = rate.upperBound {
                label.text =
                L10n.Application.interestRatesBounds(
                    numbersFormatter.dollarsFromAmount( rate.lowerBound),
                    numbersFormatter.dollarsFromAmount( upperBound)
                ) + rate.interestDescription
            } else {
                label.text = L10n.Application
                    .interestRatesNoUpperBound(
                        numbersFormatter.dollarsFromAmount( rate.lowerBound)
                    ) + rate.interestDescription
            }
            label.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(16).priority(.high)
            }
            interestRatesStackView.addArrangedSubview(label)
        }
    }
}

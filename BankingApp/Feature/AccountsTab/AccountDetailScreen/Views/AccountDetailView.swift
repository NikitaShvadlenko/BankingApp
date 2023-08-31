//
//  AccountDetailView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountDetailView: UIView {

    private let bottomBorderView = UIView()
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        [
            accountNumberView,
            amountLabel,
            availibleLabel
        ].forEach(containerView.addSubview(_:))
        containerView.isUserInteractionEnabled = true
        return containerView
    }()

    private lazy var accountNumberView: ShareLabel = {
        let view = ShareLabel(style: .labelFirst)
        return view
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textAlignment = .center
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

   private lazy var availibleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Asset.Colors.secondaryLabel.color
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension AccountDetailView {

    public func setDelegate(delegate: ShareLabelDelegate) {
        accountNumberView.delegate = delegate
    }

    public func configureView(
        accountNumber: String,
        amount: Double,
        availible: Double
    ) {
        let numberFormatter = NumberFormatter()
        let formattedAmount = numberFormatter.dollarsFromAmount(amount)
        let formattedAvalible = numberFormatter.dollarsFromAmount(availible)
        let formattedAccountNumber = accountNumber.formattedAsAcount()
        availibleLabel.text = L10n.amountAvailible(formattedAvalible)
        amountLabel.text = formattedAmount
        accountNumberView.configure(title: formattedAccountNumber)
    }
}

// MARK: - Private Methods
extension AccountDetailView {
   private func setupView() {
       addSubview(containerView)
       accountNumberView.addSubview(bottomBorderView)

       bottomBorderView.backgroundColor = Asset.Colors.secondaryLabel.color.withAlphaComponent(0.4)

       containerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.edges.equalToSuperview().inset(2)
        }

        amountLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(containerView)
        }

        accountNumberView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(25)
        }

        availibleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(amountLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }

       bottomBorderView.snp.makeConstraints { make in
           make.leading.trailing.equalToSuperview()
           make.height.equalTo(1.0)
           make.bottom.equalTo(accountNumberView.snp.bottom)
       }
    }
}

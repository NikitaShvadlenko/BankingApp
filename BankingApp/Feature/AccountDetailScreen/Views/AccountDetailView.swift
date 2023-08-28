//
//  AccountDetailView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountDetailView: UIView {

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

    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var accountNumberView: AccountNumberShareView = {
        let view = AccountNumberShareView()
        return view
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

   private lazy var availibleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
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

    public func setDelegate(delegate: AccountNumberShareViewDelegate) {
        accountNumberView.delegate = delegate
    }

    public func configureView(
        accountNumber: String,
        amount: Double,
        availible: Double,
        imageData: Data
    ) {
        let numberFormatter = NumberFormatter()
        let formattedAmount = numberFormatter.dollarsFromAmount(amount)
        let formattedAvalible = numberFormatter.dollarsFromAmount(availible)
        availibleLabel.text = L10n.amountAvailible(formattedAvalible)
        amountLabel.text = formattedAmount
        accountImageView.image = UIImage(data: imageData)
        accountNumberView.configure(accountNumber: accountNumber)
    }
}

// MARK: - Private Methods
extension AccountDetailView {
    func setupView() {
        addSubview(accountImageView)
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

        accountNumberView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(25)
        }

        availibleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(amountLabel.snp.bottom)
        }
    }
}

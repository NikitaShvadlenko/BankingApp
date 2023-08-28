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
        return containerView
    }()

    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        return imageView
    }()

    private lazy var accountNumberView: AccountNumberShareView = {
        let view = AccountNumberShareView()
        return view
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
        label.font = UIFont.systemFont(ofSize: 12)
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
        let formattedAmount = String(format: "%.2f", amount)
        let formattedAvalible = String(format: "%.2f", availible)
        availibleLabel.text = L10n.amountInDolarsAvailible(formattedAvalible)
        amountLabel.text = L10n.amountInDolars(formattedAmount)
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
            make.bottom.equalTo(amountLabel.snp.top)
        }

        availibleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(amountLabel.snp.bottom)
        }
    }
}

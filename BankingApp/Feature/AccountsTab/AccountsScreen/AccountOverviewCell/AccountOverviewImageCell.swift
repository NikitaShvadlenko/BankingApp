//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountOverviewImageCell: UITableViewCell, AccountOverviewCellProtocol {

    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        [
            accountNameLabel,
            amountLabel,
            availibleLabel
        ].forEach(containerView.addSubview(_:))
        return containerView
    }()

     lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        return imageView
    }()

     lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

     lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

     lazy var availibleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Asset.Colors.secondaryLabel.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        amountLabel.text = nil
        availibleLabel.text = nil
        accountNameLabel.text = nil
        accountImageView.image = nil
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

// MARK: - Private Methods
extension AccountOverviewImageCell {
    func setupView() {
        contentView.addSubview(accountImageView)
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

        accountNameLabel.snp.makeConstraints { make in
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

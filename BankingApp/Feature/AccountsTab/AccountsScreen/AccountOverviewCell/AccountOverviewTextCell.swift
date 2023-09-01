//
//  AccountOverviewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountOverviewTextCell: UITableViewCell, AccountOverviewCellProtocol {

    private lazy var accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(sfSymbol: SFSymbol.forward)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Asset.Colors.secondaryLabel.color
        return imageView
    }()

     lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()

     lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .natural
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

     lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .natural
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

     lazy var availibleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Asset.Colors.secondaryLabel.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        accountImageView.layer.cornerRadius = accountImageView.bounds.width / 2
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
extension AccountOverviewTextCell {
    private func setupView() {
        [
            accountImageView,
            accountNameLabel,
            amountLabel,
            availibleLabel,
            accessoryImageView
        ].forEach(contentView.addSubview)

        accountImageView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(14)
            make.width.equalTo(accountImageView.snp.height)
        }

        accountNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.top.equalTo(accountImageView.snp.top)
            make.trailing.equalTo(accessoryImageView.snp.leading)
        }

        amountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(accountImageView.snp.centerY)
            make.trailing.equalTo(accessoryImageView.snp.leading)
            make.leading.equalTo(accountImageView.snp.trailing).offset(11)
        }

        availibleLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(14)
            make.bottom.equalTo(accountImageView.snp.bottom)
            make.top.equalTo(amountLabel.snp.bottom)
            make.trailing.equalTo(accessoryImageView.snp.leading)
        }

        accessoryImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(14)
            make.centerY.equalToSuperview()
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
    }
}

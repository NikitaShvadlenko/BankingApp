//
//  AccountApplicationTableViewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationTableViewCell: UITableViewCell {

    private lazy var accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(sfSymbol: SFSymbol.forward)
        imageView.image = image
        imageView.contentMode = .center
        imageView.tintColor = Asset.Colors.secondaryLabel.color.withAlphaComponent(0.6)
        return imageView
    }()

    private lazy var resultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.tintColor = Asset.Colors.applicationFormLabel.color
        return imageView
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Asset.Colors.applicationFormLabel.color
        label.numberOfLines = 1
        return label
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = Asset.Colors.applicationFormLabel.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        resultImageView.tintColor = Asset.Colors.applicationFormLabel.color
        resultImageView.image = nil
    }
}
// MARK: - Public Methods
extension AccountApplicationTableViewCell {
    public func configure(date: Date, accountName: String, status: ApplicationStatus) {

        let image: UIImage?

        switch status {
        case .success:
            image = UIImage(sfSymbol: SFSymbol.checkmark)
        case .failed:
            image = UIImage(sfSymbol: SFSymbol.xmark)
            resultImageView.tintColor = Asset.Colors.red.color
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateLabel.text = dateFormatter.string(from: date)
        accountNameLabel.text = accountName
        resultImageView.image = image
    }
}

// MARK: - Private Methods
extension AccountApplicationTableViewCell {
    private func setupView() {
        [
            resultImageView,
            dateLabel,
            accountNameLabel,
            accessoryImageView

        ].forEach(contentView.addSubview)

        resultImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(8)
            make.width.equalTo(resultImageView.snp.height)
        }

        accountNameLabel.snp.makeConstraints { make in
            make.top.equalTo(resultImageView)
            make.leading.equalTo(resultImageView.snp.trailing).offset(8)
            make.trailing.equalTo(accessoryImageView.snp.leading)
        }

        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountNameLabel)
            make.top.equalTo(accountNameLabel.snp.bottom)
            make.bottom.equalTo(resultImageView)
            make.trailing.equalTo(accountNameLabel)
        }

        accessoryImageView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(20)
            make.width.equalTo(accessoryImageView.snp.height)
        }
    }
}

//
//  AccountApplicationTableViewCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationTableViewCell: UITableViewCell {

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Asset.Colors.primaryLabel.color
        label.numberOfLines = 1
        return label
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var accountStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
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
}
// MARK: - Public Methods
extension AccountApplicationTableViewCell {
    public func configure(date: Date, accountName: String, status: ApplicationStatus) {
        switch status {
        case .success:
            accountStatusLabel.textColor = Asset.Colors.green.color
        case .failed:
            accountStatusLabel.textColor = Asset.Colors.red.color
        }
        accountStatusLabel.text = status.rawValue

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateLabel.text = dateFormatter.string(from: date)
        accountNameLabel.text = accountName
    }
}

// MARK: - Private Methods
extension AccountApplicationTableViewCell {
    private func setupView() {
        [
            dateLabel,
            accountNameLabel,
            accountStatusLabel
        ].forEach(contentView.addSubview)

        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview()
        }

        accountNameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(dateLabel.snp.trailing).offset(8)
        }

        accountStatusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.bottom.top.equalToSuperview()
        }
    }
}

//
//  TransactionsTableHeader.swift
//  BankingApp
//
//  Created by Nikita Shvad on 29.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionsTableHeader: UITableViewHeaderFooterView {

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.secondaryLabel.color
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Public Methods
extension TransactionsTableHeader {
    public func configure(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM yyyy"
        let formattedDate = dateFormatter.string(from: date)
        dateLabel.text = formattedDate
    }
}

// MARK: - Private Methods
extension TransactionsTableHeader {
    private func setupView() {
        addSubview(dateLabel)
        contentView.backgroundColor = Asset.Colors.primaryBackground.color
        dateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(8)
        }
    }
}

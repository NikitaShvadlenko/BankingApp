//
//  AccountDetailStackView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 31.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit
import SnapKit

final class AccountDetailStackView: UIView {
    private lazy var primaryTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = Asset.Colors.transactionsTableViewLabel.color
        return label
    }()

    private lazy var secondaryTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Asset.Colors.transactionsTableViewLabel.color
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [primaryTextLabel, secondaryTextLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
// MARK: - Public Methods
extension AccountDetailStackView {
    public func configureLabels(primary: String, secondary: String) {
        primaryTextLabel.text = primary
        secondaryTextLabel.text = secondary
    }
}

// MARK: - Private Methods
extension AccountDetailStackView {
    private func setupView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}

//
//  ApplyForCardView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

class ApplyForCardView: UIView {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 26)
        titleLabel.textColor = Asset.Colors.applicationFormLabel.color
        titleLabel.textAlignment = .natural
        return titleLabel
    }()

    private lazy var pageView = OpenAccountPageView()
}

// MARK: - Public Methods
extension ApplyForCardView {
    public func configureView(
        title: String,
        pageNumber: Int,
        totalPages: Int
    ) {
        pageView.configureView(pageNumber: pageNumber, totalPages: totalPages, title: title)
    }
}
// MARK: - Private Methods
extension ApplyForCardView {
    private func setupView() {
        addSubview(titleLabel)
        addSubview(pageView)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        pageView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
}

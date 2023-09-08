//
//  OpenAccountView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

class OpenAccountView: UIView {
     lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 26)
        titleLabel.textColor = Asset.Colors.applicationFormLabel.color
        titleLabel.textAlignment = .natural
        return titleLabel
    }()

    lazy var pageView = OpenAccountPageView()

    lazy var contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension OpenAccountView {
    public func configureView(
        title: String,
        pageNumber: Int,
        totalPages: Int,
        pageTitle: String
    ) {
        titleLabel.text = title
        pageView.configureView(pageNumber: pageNumber, totalPages: totalPages, title: pageTitle)
    }
}
// MARK: - Private Methods
extension OpenAccountView {
    private func setupView() {
        backgroundColor = Asset.Colors.primaryBackground.color
        addSubview(titleLabel)
        addSubview(pageView)
        addSubview(contentView)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalToSuperview().inset(14)
        }

        pageView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
        }

        contentView.snp.makeConstraints { make in
            make.top.equalTo(pageView.snp.bottom).inset(-20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

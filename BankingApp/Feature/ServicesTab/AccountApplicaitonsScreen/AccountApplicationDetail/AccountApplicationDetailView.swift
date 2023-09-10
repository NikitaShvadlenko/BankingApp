//
//  AccountApplicationDetailView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationDetailView: UIView {

    let topSeparatorView = SeparatorView()
    let bottomSeparatorView = SeparatorView()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.anzShareLogo)
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var accountNameLabel: UILabel = {
        let accountNameLabel = UILabel()
        accountNameLabel.font = UIFont.systemFont(ofSize: 26)
        accountNameLabel.adjustsFontSizeToFitWidth = true
        accountNameLabel.minimumScaleFactor = 0.5
        accountNameLabel.textColor = Asset.Colors.applicationFormLabel.color
        accountNameLabel.textAlignment = .natural
        return accountNameLabel
    }()

    private lazy var applicationStatusLabel: UILabel = {
        let applicationStatusLabel = UILabel()
        applicationStatusLabel.font = UIFont.systemFont(ofSize: 18)
        applicationStatusLabel.textColor = Asset.Colors.applicationFormLabel.color
        applicationStatusLabel.textAlignment = .natural
        return applicationStatusLabel
    }()

    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.textColor = Asset.Colors.applicationFormLabel.color
        dateLabel.textAlignment = .natural
        return dateLabel
    }()

    private lazy var reasonLabel: UILabel = {
        let reasonLabel = UILabel()
        reasonLabel.font = UIFont.systemFont(ofSize: 18)
        reasonLabel.textColor = Asset.Colors.applicationFormLabel.color
        reasonLabel.textAlignment = .natural
        return reasonLabel
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
extension AccountApplicationDetailView {
    public func configureView(
        accountName: String,
        date: Date,
        reason: String?,
        applicationStatus: ApplicationStatus
    ) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        accountNameLabel.text = accountName
        dateLabel.text = dateFormatter.string(from: date)
        reasonLabel.text = reason
        switch applicationStatus {
        case .success:
            applicationStatusLabel.text = L10n.ApplicationStatus.success
        case .failed:
            applicationStatusLabel.text = L10n.ApplicationStatus.rejected
        }
    }
}

// MARK: - Private Methods
extension AccountApplicationDetailView {
    private func setupView() {
        backgroundColor = Asset.Colors.primaryBackground.color

        [
            topSeparatorView,
            dateLabel,
            accountNameLabel,
            applicationStatusLabel,
            reasonLabel,
            logoImageView,
            bottomSeparatorView
        ].forEach(addSubview)

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        topSeparatorView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(1)
        }

        accountNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(topSeparatorView.snp.bottom).offset(20)
        }

        applicationStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(accountNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        reasonLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(applicationStatusLabel.snp.bottom).offset(10)
        }

        bottomSeparatorView.snp.makeConstraints { make in
            make.top.equalTo(reasonLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(1)
        }

        logoImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(250)
        }
    }
}

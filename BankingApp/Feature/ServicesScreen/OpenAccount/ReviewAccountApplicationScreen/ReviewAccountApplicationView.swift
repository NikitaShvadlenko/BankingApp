//
//  ReviewAccountApplicationView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ReviewAccountApplicationView: OpenAccountView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    let reviewAccountApplicationDisclaimerView = ReviewAccountApplicationDisclaimerView()

    private lazy var scrollViewContentView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(scrollViewContentView)
        return scrollView
    }()

    private lazy var accountDetailsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.applicationPageViewBackground.color
        view.addSubview(accountDetailsTitleLabel)
        [
            accountDetailsTitleLabel,
            accountChosenLabel,
            accountNameLabel,
            reviewAccountApplicationDisclaimerView
        ].forEach(view.addSubview)
        return view
    }()

    private lazy var accountDetailsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.ApplicationReview.accountDetails
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        return label
    }()

    private lazy var accountChosenLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.ApplicationReview.accountChosen
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        return label
    }()

    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        return label
    }()

    private lazy var taxDetailsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.applicationPageViewBackground.color
        [
            taxDetailsTitleLabel,
            taxResidencyLabel
        ].forEach(view.addSubview)
        return view
    }()

    private lazy var taxDetailsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.ApplicationReview.taxDetails
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        return label
    }()

    private lazy var taxResidencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        return label
    }()

    private lazy var dateOfBirthContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.applicationPageViewBackground.color
        [
            dateOfBirthTitleLabel,
            dateOfBirthLabel
        ].forEach(view.addSubview)
        return view
    }()

    private lazy var dateOfBirthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.ApplicationReview.ageTitle
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        return label
    }()

    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension ReviewAccountApplicationView {
    public func configure(accountName: String, taxResidencyStatus: String, dateOfBirth: Date) {
        accountNameLabel.text = accountName
        taxResidencyLabel.text = taxResidencyStatus
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .long
        let formattedDate = dateFormatter.string(from: dateOfBirth)
        dateOfBirthLabel.text = L10n.ApplicationReview.dateOfBirth(formattedDate)
    }
}
// MARK: - Private methods
extension ReviewAccountApplicationView {
    // swiftlint:disable function_body_length
    private func configureViews() {
        backgroundColor = Asset.Colors.primaryBackground.color
        contentView.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }

        scrollViewContentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(contentView)
            make.height.equalTo(contentView).priority(.low)
        }

        scrollViewContentView.addSubview(accountDetailsContainerView)
        scrollView.addSubview(taxDetailsContainerView)
        scrollView.addSubview(dateOfBirthContainerView)

        accountDetailsContainerView.snp.makeConstraints { make in
            make.top.equalTo(scrollViewContentView).inset(20)
            make.leading.trailing.equalTo(scrollViewContentView).inset(20)
        }

        taxDetailsContainerView.snp.makeConstraints { make in
            make.top.equalTo(accountDetailsContainerView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollViewContentView).inset(20)
        }

        dateOfBirthContainerView.snp.makeConstraints { make in
            make.top.equalTo(taxDetailsContainerView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollViewContentView).inset(20)
        }

        reviewAccountApplicationDisclaimerView.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirthContainerView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollViewContentView).inset(20)
            make.bottom.equalTo(scrollViewContentView).inset(20)
        }
        
        accountDetailsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(accountDetailsContainerView).inset(20)
            make.leading.trailing.equalTo(accountDetailsContainerView).inset(20)
        }

        accountChosenLabel.snp.makeConstraints { make in
            make.top.equalTo(accountDetailsTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(accountDetailsTitleLabel)
        }

        accountNameLabel.snp.makeConstraints { make in
            make.top.equalTo(accountChosenLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(accountChosenLabel)
            make.bottom.equalTo(accountDetailsContainerView).inset(20)
        }

        taxDetailsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(taxDetailsContainerView).inset(20)
            make.leading.trailing.equalTo(taxDetailsContainerView).inset(20)
        }

        taxResidencyLabel.snp.makeConstraints { make in
            make.top.equalTo(taxDetailsTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(taxDetailsContainerView).inset(20)
            make.bottom.equalTo(taxDetailsContainerView).inset(20)
        }

        dateOfBirthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirthContainerView).inset(20)
            make.leading.trailing.equalTo(dateOfBirthContainerView).inset(20)
        }

        dateOfBirthLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(dateOfBirthContainerView).inset(20)
            make.top.equalTo(dateOfBirthTitleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(dateOfBirthContainerView).inset(20)
        }
    }
}

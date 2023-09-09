//
//  ReviewAccountApplicationDisclaimerView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ReviewAccountApplicationDisclaimerView: UIView {

    let topSeparatorView = SeparatorView()

    private lazy var selectionBox: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        // TODO: Selection
        return imageView
    }()

    private lazy var openAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.ApplicationReview.openAccount, for: .normal)
        button.backgroundColor = Asset.Colors.nextButton.color
        button.titleLabel?.textColor = Asset.Colors.primaryBackground.color
        // TODO: addTarget
        return button
    }()

    private lazy var accountAccessTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.text = L10n.ApplicationReview.accountAccessTitle
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var accountAccessLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.text = L10n.ApplicationReview.accountAccessDetails
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    let bottomSeparatorView = SeparatorView()

    private lazy var importantInformationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.text = L10n.ApplicationReview.importantInformationTitle
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var importantInformationBulletPointLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.baselineAdjustment = .alignCenters
        label.textColor = Asset.Colors.primaryLabel.color
        let text = L10n.ApplicationReview.importantInformationBulletPoints(
            L10n.ApplicationReview.firstPoint,
            L10n.ApplicationReview.secondPoint,
            L10n.ApplicationReview.thirdPoint
        )
        label.attributedText = text.bulletPointStyle(
            bulletPointFont: UIFont.systemFont(ofSize: 26, weight: .bold),
            textFont: UIFont.systemFont(ofSize: 18)
        )
        return label
    }()

    private lazy var importantInformationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.textColor = Asset.Colors.primaryLabel.color
        label.text = L10n.ApplicationReview.importantInformation
        return label
    }()

    private lazy var linkTextView: LinkTextView = {
        let linkView = LinkTextView(
            mainPart: L10n.ApplicationReview.firstPartOfLinkLabel,
            linkPart: L10n.ApplicationReview.linkPart,
            link: Links.generalTerms.rawValue,
            trailingPart: L10n.ApplicationReview.trailingPart
        )
        linkView.configureView(
            font: UIFont.systemFont(ofSize: 18),
            textColor: Asset.Colors.primaryLabel.color
        )
        return linkView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

}

// MARK: - Private Methods
extension ReviewAccountApplicationDisclaimerView {
    private func setupView() {
        [
            topSeparatorView,
            accountAccessTitleLabel,
            accountAccessLabel,
            bottomSeparatorView,
            importantInformationTitleLabel,
            importantInformationLabel,
            importantInformationBulletPointLabel,
            selectionBox,
            linkTextView,
            openAccountButton
        ].forEach(addSubview)

        topSeparatorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(14)
            make.height.equalTo(1)
        }

        accountAccessTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(topSeparatorView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topSeparatorView)
        }

        accountAccessLabel.snp.makeConstraints { make in
            make.top.equalTo(accountAccessTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(topSeparatorView)
        }

        bottomSeparatorView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topSeparatorView)
            make.height.equalTo(topSeparatorView)
            make.top.equalTo(accountAccessLabel.snp.bottom).offset(20)
        }

        importantInformationTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topSeparatorView)
            make.top.equalTo(bottomSeparatorView.snp.bottom).offset(20)
        }

        importantInformationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(topSeparatorView)
            make.top.equalTo(importantInformationTitleLabel.snp.bottom).offset(10)
        }

        importantInformationBulletPointLabel.snp.makeConstraints { make in
            make.top.equalTo(importantInformationLabel.snp.bottom)
            make.leading.equalTo(topSeparatorView).inset(10)
            make.trailing.equalTo(topSeparatorView)
        }

        selectionBox.snp.makeConstraints { make in
            make.leading.equalTo(topSeparatorView)
            make.top.equalTo(importantInformationBulletPointLabel.snp.bottom).offset(20)
            make.width.equalTo(20)
            make.height.equalTo(selectionBox.snp.width)
        }

        linkTextView.snp.makeConstraints { make in
            make.leading.equalTo(selectionBox.snp.trailing).offset(10)
            make.top.equalTo(selectionBox.snp.top).inset(-10)
            make.trailing.equalTo(topSeparatorView)
            make.height.greaterThanOrEqualTo(100).priority(.high)
        }

        openAccountButton.snp.makeConstraints { make in
            make.top.equalTo(linkTextView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topSeparatorView)
            make.height.equalTo(80)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

//
//  ReviewAccountApplicationDisclaimerView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ReviewAccountApplicationDisclaimerViewDelegate: AnyObject {
    func reviewAccountApplicationDisclaimerViewDidTriggerBox(
        _ view: ReviewAccountApplicationDisclaimerView,
        isSelected: Bool
    )
    func reviewAccountApplicationDisclaimerView(
        _ view: ReviewAccountApplicationDisclaimerView,
        didTapOpenAccountButton button: UIButton
    )
}

final class ReviewAccountApplicationDisclaimerView: UIView {

    weak var delegate: ReviewAccountApplicationDisclaimerViewDelegate?

    private var isBoxSelected: Bool = false {
        didSet {
            selectionBox.backgroundColor =
            isBoxSelected ? Asset.Colors.segmentedControlSelector.color : Asset.Colors.primaryBackground.color
            selectionBox.image = isBoxSelected ? selectionImage : nil
        }
    }

    let topSeparatorView = SeparatorView()

    private lazy var selectionImage: UIImage = {
        guard let image = UIImage(sfSymbol: SFSymbol.checkmark)?.withRenderingMode(.alwaysTemplate) else {
            return UIImage()
        }
        let newSize = CGSize(width: 18, height: 18)
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: newSize))

        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()?.withTintColor(.white) ?? UIImage()
        UIGraphicsEndImageContext()

        return resizedImage
    }()

    private lazy var selectionBox: UIImageView = {
        let imageView = ExtendedHitImageView()
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.tintColor = Asset.Colors.primaryBackground.color
        imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(selectionBoxTapped)
        )
        imageView.addGestureRecognizer(tapGesture)

        return imageView
    }()

    private lazy var openAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.ApplicationReview.openAccount, for: .normal)
        button.backgroundColor = Asset.Colors.applicationFormLabel.color
        button.titleLabel?.textColor = Asset.Colors.primaryBackground.color
        button.addTarget(self, action: #selector(openAccountButtonTapped), for: .touchUpInside)
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
    // swiftlint:disable function_body_length
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
            make.height.greaterThanOrEqualTo(120)
        }

        openAccountButton.snp.makeConstraints { make in
            make.top.equalTo(linkTextView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topSeparatorView)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().inset(20)
        }
    }

    @objc
    private func selectionBoxTapped() {
        isBoxSelected.toggle()
        delegate?.reviewAccountApplicationDisclaimerViewDidTriggerBox(self, isSelected: isBoxSelected)
    }

    @objc
    private func openAccountButtonTapped() {
        UIView.animate(withDuration: 0.1) {
            self.openAccountButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.openAccountButton.transform = CGAffineTransform.identity
            }
        }
        delegate?.reviewAccountApplicationDisclaimerView(self, didTapOpenAccountButton: openAccountButton)
    }
}

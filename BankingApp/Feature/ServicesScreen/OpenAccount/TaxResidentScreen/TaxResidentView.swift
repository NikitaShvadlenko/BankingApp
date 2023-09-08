//
//  TaxResidentView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol TaxResidentViewDelegate: AnyObject {
    func viewDidPressNextButton(_ view: TaxResidentView)
    func viewDidPressPreviousButton(_ view: TaxResidentView)
}

final class TaxResidentView: OpenAccountView {

    weak var delegate: TaxResidentViewDelegate?

    var isNextButtonEnabled: Bool = false {
        didSet {
            nextButton.isUserInteractionEnabled = isNextButtonEnabled
            if isNextButtonEnabled {
                nextButton.alpha = 1
            } else {
                nextButton.alpha = 0.5
            }
        }
    }

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Application.next, for: .normal)
        button.setTitleColor(Asset.Colors.primaryBackground.color, for: .normal)
        button.backgroundColor = Asset.Colors.nextButton.color
        button.alpha = 0.5
        button.isUserInteractionEnabled = false
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var selectionView = SelectionView()

    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Application.previous, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = Asset.Colors.applicationFormLabel.color.cgColor
        button.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
        button.backgroundColor = Asset.Colors.primaryBackground.color
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var taxTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        label.text = L10n.Application.taxDetailsTitle
        return label
    }()

    private lazy var taxDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.text = L10n.Application.taxDetailsDescription
        return label
    }()

    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nextButton, previousButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension TaxResidentView {
    private func configureViews() {
        backgroundColor = Asset.Colors.primaryBackground.color
        [
            taxTitleLabel,
            taxDescriptionLabel,
            selectionView,
            verticalStackView
        ].forEach(contentView.addSubview)

        taxTitleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).inset(20)
        }

        taxDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(taxTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView).inset(20)
        }

        selectionView.snp.makeConstraints { make in
            make.top.equalTo(taxDescriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(45)
        }

        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(selectionView.snp.bottom).offset(20)
            make.height.equalTo(95)
            make.leading.trailing.equalTo(contentView).inset(20)
        }
    }

    @objc
    private func nextButtonPressed() {
        delegate?.viewDidPressNextButton(self)
    }

    @objc
    private func previousButtonPressed() {
        delegate?.viewDidPressPreviousButton(self)
    }
}

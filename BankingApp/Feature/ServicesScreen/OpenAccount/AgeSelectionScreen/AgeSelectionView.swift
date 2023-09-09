//
//  AgeSelectionView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol AgeSelectionViewDelegate: AnyObject {
    func viewDidPressNextButton(_ veiw: AgeSelectionView)
    func viewDidPressPreviousButton(_ veiw: AgeSelectionView)
}

final class AgeSelectionView: OpenAccountView {

    weak var delegate: AgeSelectionViewDelegate?

    private lazy var dateOfBirthTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        label.text = L10n.Application.selectYourAge
        return label
    }()

    private lazy var yourDateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Asset.Colors.primaryLabel.color
        label.textAlignment = .natural
        label.text = L10n.Application.yourDateOfBirthIs
        return label
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.applicationPageViewBackground.color
        view.addSubview(yourDateOfBirthLabel)
        view.addSubview(datePicker)
        return view
    }()

    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        var dateComponents = DateComponents()
        dateComponents.year = -45
        if let date = Calendar.current.date(
            byAdding: dateComponents,
            to: Date()
        ) {
            datePicker.date = date
        }
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.contentMode = .center
        return datePicker
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Application.next, for: .normal)
        button.setTitleColor(Asset.Colors.primaryBackground.color, for: .normal)
        button.backgroundColor = Asset.Colors.applicationFormLabel.color
        button.alpha = 0.5
        button.isUserInteractionEnabled = false
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nextButton, previousButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Application.previous, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = Asset.Colors.applicationFormLabel.color.cgColor
        button.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
        button.backgroundColor = Asset.Colors.primaryBackground.color
       button.addTarget(self, action: #selector(previousButtonPressed), for: .touchUpInside)
        return button
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
extension AgeSelectionView {
    private func configureViews() {
        backgroundColor = Asset.Colors.primaryBackground.color
        contentView.addSubview(dateOfBirthTitleLabel)
        contentView.addSubview(containerView)
        containerView.addSubview(verticalStackView)
        dateOfBirthTitleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).inset(20)
        }

        containerView.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirthTitleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.leading.trailing.equalTo(contentView)
        }

        datePicker.snp.makeConstraints { make in
            make.top.bottom.equalTo(containerView).inset(10)
            make.leading.trailing.equalTo(containerView).inset(20)
        }

        yourDateOfBirthLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(containerView).inset(10)
            make.leading.trailing.equalTo(containerView).inset(20)
        }

        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
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

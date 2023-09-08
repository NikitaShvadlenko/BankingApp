//
//  SelectionView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol SelectionViewDelegate: AnyObject {
    func selectionView(_ selectionView: SelectionView, didSelectOption: SelectionViewOption)
}

enum SelectionViewOption {
    case yes
    // swiftlint:disable identifier_name
    case no
}

final class SelectionView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    weak var delegate: SelectionViewDelegate?

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [yesButton, noButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let yesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(L10n.yes, for: .normal)
        button.addTarget(
            self, action: #selector(yesSelected), for: .touchUpInside
        )
        button.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        button.layer.borderWidth = 1
        return button
    }()

    private let noButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(L10n.no, for: .normal)
        button.addTarget(
            self, action: #selector(noSelected), for: .touchUpInside
        )
        button.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        button.layer.borderWidth = 1
        return button
    }()
}

// MARK: - Private Methods
extension SelectionView {
    private func setupView() {
        backgroundColor = Asset.Colors.primaryBackground.color
        addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func configureViewWithOption(_ selectedOption: SelectionViewOption) {
        switch selectedOption {
        case .yes:
            yesButton.layer.borderColor = Asset.Colors.applicationFormLabel.color.cgColor
            noButton.layer.borderColor =  Asset.Colors.secondaryLabel.color.cgColor
            yesButton.setTitleColor(Asset.Colors.titleSelectionSelected.color, for: .normal)
            noButton.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
        case .no:
            yesButton.layer.borderColor =  Asset.Colors.secondaryLabel.color.cgColor
            noButton.layer.borderColor = Asset.Colors.applicationFormLabel.color.cgColor
            yesButton.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
            noButton.setTitleColor(Asset.Colors.titleSelectionSelected.color, for: .normal)
        }
    }

    @objc
    private func yesSelected() {
        configureViewWithOption(.yes)
        delegate?.selectionView(self, didSelectOption: .yes)
    }

    @objc
    private func noSelected() {
        configureViewWithOption(.no)
        delegate?.selectionView(self, didSelectOption: .no)
    }
}

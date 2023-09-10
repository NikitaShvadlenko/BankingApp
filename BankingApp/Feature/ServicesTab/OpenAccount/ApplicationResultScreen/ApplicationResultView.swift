//
//  ApplicationResultView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ApplicationResultViewDelegate: AnyObject {
    func viewDidPressViewApplicationsButton(_ view: ApplicationResultView)
    func viewDidPressCloseButton(_ view: ApplicationResultView)
}

final class ApplicationResultView: UIView {

    weak var delegate: ApplicationResultViewDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = Asset.Colors.applicationFormLabel.color
        label.textAlignment = .natural
        label.text = L10n.ApplicationResultView.success
        return label
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textColor = Asset.Colors.applicationFormLabel.color
        label.text = L10n.ApplicationResultView.message
        label.textAlignment = .natural
        return label
    }()

    private lazy var viewApplicationsButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.ApplicationResultView.viewApplications, for: .normal)
        button.setTitleColor(Asset.Colors.primaryBackground.color, for: .normal)
        button.backgroundColor = Asset.Colors.applicationFormLabel.color
        button.addTarget(self, action: #selector(viewApplicationsButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = Asset.Colors.applicationFormLabel.color.cgColor
        button.setTitle(L10n.ApplicationResultView.close, for: .normal)
        button.setTitleColor(Asset.Colors.applicationFormLabel.color, for: .normal)
        button.backgroundColor = Asset.Colors.primaryBackground.color
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
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
extension ApplicationResultView {
    private func setupView() {
        backgroundColor = Asset.Colors.primaryBackground.color
        [
            titleLabel,
            messageLabel,
            viewApplicationsButton,
            closeButton
        ].forEach(addSubview)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(titleLabel)
        }

        viewApplicationsButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.top.equalTo(messageLabel.snp.bottom).offset(40)
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalTo(viewApplicationsButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(viewApplicationsButton)
            make.height.equalTo(viewApplicationsButton)
            make.centerX.equalTo(viewApplicationsButton)
        }
    }

    @objc
    private func viewApplicationsButtonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.viewApplicationsButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.viewApplicationsButton.transform = CGAffineTransform.identity
            }
        }
        delegate?.viewDidPressViewApplicationsButton(self)
    }

    @objc
    private func closeButtonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.closeButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.closeButton.transform = CGAffineTransform.identity
            }
        }
        delegate?.viewDidPressCloseButton(self)
    }
}

//
//  AccountNumberView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol AccountNumberShareViewDelegate: AnyObject {
    func accountNumberTapped()
}

final class AccountNumberShareView: UIView {

    weak var delegate: AccountNumberShareViewDelegate?

    private let containerView = UIView()
    private let bottomBorderView = UIView()

    private lazy var accountNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private lazy var shareImageView: UIImageView = {
        let view = UIImageView()
       let configuration = UIImage.SymbolConfiguration(
        pointSize: 16,
        weight: .light,
        scale: .medium
       )
        view.image = UIImage(sfSymbol: SFSymbol.share, withConfiguration: configuration)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tapGesture)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension AccountNumberShareView {
    public func configure(accountNumber: String) {
        let formattedNumber = accountNumber.formattedAsAcount()
        accountNumberLabel.text = formattedNumber
    }

}
// MARK: - Private Methods
extension AccountNumberShareView {
    private func setupView() {
        addSubview(bottomBorderView)
        addSubview(containerView)
        bottomBorderView.backgroundColor = Asset.Colors.secondaryLabel.color.withAlphaComponent(0.4)

        [
            accountNumberLabel,
            shareImageView
        ].forEach(containerView.addSubview)

        accountNumberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(containerView.snp.centerY)
        }

        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(accountNumberLabel.snp.bottom)
            make.center.equalToSuperview()
        }

        bottomBorderView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }

        shareImageView.snp.makeConstraints { make in
            make.leading.equalTo(accountNumberLabel.snp.trailing).offset(2)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(accountNumberLabel.snp.centerY)
        }
    }

    @objc
    private func viewTapped() {
        delegate?.accountNumberTapped()
    }
}

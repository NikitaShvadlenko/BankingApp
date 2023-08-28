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

    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomLine(to: containerView)
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

        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        [
            accountNumberLabel,
            shareImageView
        ].forEach(containerView.addSubview)

        accountNumberLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(containerView.snp.centerY)
        }

        containerView.snp.makeConstraints { make in
            make.bottom.equalTo(accountNumberLabel.snp.bottom)
        }

        shareImageView.snp.makeConstraints { make in
            make.leading.equalTo(accountNumberLabel.snp.trailing).offset(2)
            make.centerY.equalTo(accountNumberLabel.snp.centerY)
        }
    }

    private func addBottomLine(to view: UIView) {
        let layer = CALayer()
        layer.frame = CGRect(
            x: 0, y: view.frame.height - 0.5,
            width: view.frame.width, height: -0.5
        )
        layer.backgroundColor = Asset.Colors.secondaryLabel.color.cgColor
        view.layer.addSublayer(layer)
    }

    @objc
    private func viewTapped() {
        delegate?.accountNumberTapped()
    }
}

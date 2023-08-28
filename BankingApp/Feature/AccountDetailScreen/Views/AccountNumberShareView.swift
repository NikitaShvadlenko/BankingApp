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

    private lazy var accountNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.shareLink.color
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private lazy var shareImageView: UIImageView = {
        let view = UIImageView()
       let configuration = UIImage.SymbolConfiguration(
        pointSize: 12,
        weight: .medium,
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
        addBottomLine()
    }
}

// MARK: - Public Methods
extension AccountNumberShareView {
    public func configure(accountNumber: String) {
        let formattedNumber = formatString(accountNumber)
        accountNumberLabel.text = formattedNumber
    }

}
// MARK: - Private Methods
extension AccountNumberShareView {
    private func setupView() {
        [
            accountNumberLabel,
            shareImageView
        ].forEach(addSubview)

        accountNumberLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        shareImageView.snp.makeConstraints { make in
            make.leading.equalTo(accountNumberLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(shareImageView.snp.height)
        }
    }

    private func addBottomLine() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: accountNumberLabel.frame.height - 1, width: accountNumberLabel.frame.width, height: 1)
        layer.backgroundColor = Asset.Colors.secondaryLabel.color.cgColor
        accountNumberLabel.layer.addSublayer(layer)
    }

    private func formatString(_ accountNumber: String) -> String {
        var result = ""

        let chunkLengths = [2, 4, 7, 2]
        var currentIndex = 0

        for chunkLength in chunkLengths {

            let start = accountNumber.index(accountNumber.startIndex, offsetBy: currentIndex)
            let end = accountNumber.index(
                start, offsetBy: chunkLength,
                limitedBy: accountNumber.endIndex
            ) ?? accountNumber.endIndex
            let chunk = String(accountNumber[start..<end])

            result += chunk

            if end != accountNumber.endIndex {
                result += "-"
            }
            currentIndex += chunkLength
        }
        return result
    }

    @objc
    private func viewTapped() {
        delegate?.accountNumberTapped()
    }
}

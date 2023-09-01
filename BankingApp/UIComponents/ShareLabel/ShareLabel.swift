//
//  AccountNumberView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ShareLabelDelegate: AnyObject {
    func accountNumberTapped()
}

final class ShareLabel: UIView {

    weak var delegate: ShareLabelDelegate?
    let style: Style

    private let containerView = UIView()

    private lazy var label: UILabel = {
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

    init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tapGesture)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension ShareLabel {
    public func configure(title: String) {
        label.text = title
    }

}
// MARK: - Private Methods
extension ShareLabel {
    private func setupView() {
        addSubview(containerView)

        [
            label,
            shareImageView
        ].forEach(containerView.addSubview)

        let strategy = ShareLabelConstraintStrategyFactory.strategy(for: style)
        strategy.setConstraints(
            containerView: containerView,
            label: label,
            imageView: shareImageView
        )
    }

    @objc
    private func viewTapped() {
        delegate?.accountNumberTapped()
    }
}

// MARK: - ShareLabelStyle
extension ShareLabel {
    enum Style {
        case imageFirst
        case labelFirst
        case imageFirstLeading
    }
}

//
//  TransactionPagingView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 31.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionPagingView: UIView {

    private lazy var forwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(sfSymbol: SFSymbol.forward)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        
        return button
    }()

    private lazy var backwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(sfSymbol: SFSymbol.back)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()

    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = Asset.Colors.secondaryLabel.color
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension TransactionPagingView {
    public func configureView(totalPages: Int, currentPage: Int) {

    }
}

// MARK: - Private Methods
extension TransactionPagingView {
    private func setupView() {
        [
            forwardButton,
            backwardButton,
            pageLabel
        ].forEach(addSubview)

        pageLabel.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        forwardButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(pageLabel)
            make.width.equalTo(forwardButton.snp.height)
        }

        backwardButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(pageLabel)
            make.width.equalTo(backwardButton.snp.height)
        }
    }
}

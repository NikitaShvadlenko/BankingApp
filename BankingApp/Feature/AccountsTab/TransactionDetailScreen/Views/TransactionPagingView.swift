//
//  TransactionPagingView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 31.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol TransactoinPagingViewDelegate: AnyObject {
    func transacitonPagingViewDidTapForwardButton(_ transactionPagingView: TransactionPagingView)
    func transacitonPagingViewDidTapBackButton(_ transactionPagingView: TransactionPagingView)
}

final class TransactionPagingView: UIView {

    weak var delegate: TransactoinPagingViewDelegate?

    private lazy var forwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(sfSymbol: SFSymbol.forward)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.alpha = 1
        button.tintColor = Asset.Colors.segmentedControlSelector.color
        button.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(sfSymbol: SFSymbol.back)
        button.setImage(image, for: .normal)
        button.alpha = 1
        button.contentMode = .scaleAspectFit
        button.tintColor = Asset.Colors.segmentedControlSelector.color
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
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
        UIView.animate(withDuration: 0.2) {
            self.pageLabel.text = L10n.TransactionDetailPage.pageNumber(currentPage, totalPages)
        }

        forwardButton.alpha = 1
        backwardButton.alpha = 1

        if currentPage == 1 {
            backwardButton.alpha = 0
        }
        if currentPage == totalPages {
            forwardButton.alpha = 0
        }
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

    @objc
    private func backButtonTapped() {
        delegate?.transacitonPagingViewDidTapBackButton(self)
    }

    @objc
    private func forwardButtonTapped() {
        delegate?.transacitonPagingViewDidTapForwardButton(self)
    }
}

//
//  TransactionPagingView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 31.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol TransactionPagingViewDelegate: AnyObject {
    func transacitonPagingViewDidTapForwardButton(_ transactionPagingView: TransactionPagingView)
    func transacitonPagingViewDidTapBackButton(_ transactionPagingView: TransactionPagingView)
}

final class TransactionPagingView: UIView {

    weak var delegate: TransactionPagingViewDelegate?

    private lazy var forwardButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold, scale: .large)
        let image = UIImage(sfSymbol: SFSymbol.forward, withConfiguration: configuration)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.alpha = 0
        button.tintColor = Asset.Colors.segmentedControlSelector.color
        button.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backwardButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold, scale: .large)
        let image = UIImage(sfSymbol: SFSymbol.back, withConfiguration: configuration)
        button.setImage(image, for: .normal)
        button.alpha = 0
        button.contentMode = .scaleAspectFit
        button.tintColor = Asset.Colors.segmentedControlSelector.color
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var pageSelectedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Asset.Colors.primaryLabel.color
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pageSelectedLabel, pageLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
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
        UIView.animate(withDuration: 0.3) {
            self.pageSelectedLabel.alpha = 0
        } completion: { _ in
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.1,
                options: []) {
                    self.pageSelectedLabel.alpha = 1
                }
        }

        pageSelectedLabel.text = "\(currentPage)"
        pageLabel.text = L10n.TransactionDetailPage.pageNumber(totalPages)
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
            stackView
        ].forEach(addSubview)

        stackView.snp.makeConstraints { make in
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

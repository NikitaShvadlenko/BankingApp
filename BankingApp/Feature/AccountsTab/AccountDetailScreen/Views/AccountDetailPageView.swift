//
//  AccountDetailPageView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 31.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol AccountDetailPageViewDelegate: AnyObject {
    func accountDetailPagescrollView(
        _ transactionsTableScrollView: UIScrollView,
        offset offsetY: CGFloat
    )
}

final class AccountDetailPageView: UIView {
    weak var delegate: AccountDetailPageViewDelegate?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.addSubview(scrollContentView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    private lazy var accountNameStackView = AccountDetailStackView()
    private lazy var accountTypeStackView = AccountDetailStackView()

    private lazy var accountDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountNameStackView, accountTypeStackView])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        return stackView
    }()

    private lazy var scrollContentView: UIView = {
        let view = UIView()
        view.addSubview(accountDetailsStackView)
        return view
    }()

    private lazy var separatorView = SeparatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension AccountDetailPageView {
    public func configureView(name: String, type: String) {
        accountTypeStackView.configureLabels(primary: L10n.AccountDetailPage.accountType, secondary: type)
        accountNameStackView.configureLabels(primary: L10n.AccountDetailPage.accountName, secondary: name)
    }
}
// MARK: - UIScrollViewDelegate
extension AccountDetailPageView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset: Double
        if scrollView.contentOffset.y > 0 {
           offset = scrollView.contentOffset.y * 10
        } else {
            offset = scrollView.contentOffset.y
        }
        delegate?.accountDetailPagescrollView(scrollView, offset: offset)

    }
}

// MARK: - Private Methods
extension AccountDetailPageView {
    func setupView() {
        addSubview(scrollView)
        backgroundColor = Asset.Colors.primaryBackground.color

        scrollContentView.addSubview(separatorView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollContentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        accountDetailsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
        }

        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.top.equalTo(accountDetailsStackView.snp.bottom).offset(14)
            make.height.equalTo(1)
        }

        scrollView.contentSize = scrollContentView.bounds.size
    }
}

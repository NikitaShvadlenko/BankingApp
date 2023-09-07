//
//  ApplyForCardFooterView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 07.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ApplyForCardFooterDelegate: AnyObject {
    func viewDidPressNextButton(_ view: ApplyForCardFooterView)
}

final class ApplyForCardFooterView: UITableViewHeaderFooterView {

    weak var delegate: ApplyForCardFooterDelegate?

    private var separatorView = SeparatorView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 1
        label.textColor = Asset.Colors.primaryLabel.color
        label.text = L10n.Application.importantInformation
        return label
    }()

    private lazy var linkLabel: LinkTextView = {
        let linkView = LinkTextView(
            mainPart: L10n.Application.disclaimerMainPart,
            linkPart: L10n.Application.disclaimerLinkPart,
            link: Links.anzLink.rawValue
        )
        linkView.text.append(".")
        return linkView
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private Methods
extension ApplyForCardFooterView {
    private func setupView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(linkLabel)
        contentView.addSubview(nextButton)
        contentView.addSubview(separatorView)

        separatorView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.trailing.equalTo(contentView).inset(14)
            make.height.equalTo(1)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(14)
            make.leading.trailing.equalTo(separatorView)
        }

        linkLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(separatorView)
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(linkLabel.snp.bottom)
            make.leading.trailing.equalTo(separatorView)
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }

    }

    @objc
    func nextButtonTapped() {
        delegate?.viewDidPressNextButton(self)
    }
}

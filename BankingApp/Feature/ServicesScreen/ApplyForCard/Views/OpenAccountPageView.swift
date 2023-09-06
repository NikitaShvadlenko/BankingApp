//
//  OpenAccountPageView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class OpenAccountPageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.applicationPageViewBackground.color
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    private lazy var pageImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(sfSymbol: SFSymbol.message)?.withHorizontallyFlippedOrientation()
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.tintColor = Asset.Colors.applicationFormLabel.color
        return imageView
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(asset: Asset.Colors.applicationFormLabel)
        return label
    }()

    private lazy var pageNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(asset: Asset.Colors.applicationFormLabel)
        return label
    }()

    private lazy var pageSelectedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(asset: Asset.Colors.applicationFormLabel)
        return label
    }()

    private lazy var pageTotalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(asset: Asset.Colors.applicationFormLabel)
        return label
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
}

// MARK: - Public Methods
extension OpenAccountPageView {
    public func configureView(pageNumber: Int, totalPages: Int, title: String) {
        numberLabel.text = "\(pageNumber)"
        pageNameLabel.text = title
        pageSelectedLabel.text = "\(pageNumber)"
        pageTotalLabel.text = L10n.Application.ofPageNumber(totalPages)
    }
}

// MARK: - Private Methods
extension OpenAccountPageView {
    private func setupView() {
        [
            pageNameLabel,
            pageTotalLabel,
            pageSelectedLabel,
            pageImage
        ].forEach(addSubview)

        pageImage.addSubview(numberLabel)
        pageImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(pageImage.snp.height)
        }

        numberLabel.snp.makeConstraints { make in
            make.center.equalTo(pageImage)
        }

        pageNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(pageImage.snp.trailing).offset(14)
            make.top.bottom.equalTo(numberLabel)
        }

        pageTotalLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalTo(numberLabel)
        }

        pageSelectedLabel.snp.makeConstraints { make in
            make.trailing.equalTo(pageTotalLabel.snp.leading)
            make.top.bottom.equalTo(pageTotalLabel)
        }
    }
}

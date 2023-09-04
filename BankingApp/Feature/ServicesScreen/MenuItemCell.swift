//
//  MenuItemCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class MenuItemCell: UICollectionViewCell {

    private lazy var imageContainer: UIView = {
        let view = UIView()
        view.layer.borderWidth = 4
        view.addSubview(imageView)
        view.layer.borderColor = Asset.Colors.primaryBackground.color.cgColor
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Asset.Colors.primaryBackground.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.Colors.primaryBackground.color
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension MenuItemCell {
    public func configure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}

// MARK: - Private Methods
extension MenuItemCell {
    private func setupView() {
        addSubview(imageContainer)
        addSubview(titleLabel)

        imageContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-8)
            make.width.equalTo(imageContainer.snp.height)
            make.centerX.equalTo(titleLabel)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(15)
        }

        imageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(imageContainer).inset(10)
            make.centerX.equalTo(imageContainer)
            make.width.equalTo(imageView.snp.height)
        }

        layoutIfNeeded()
        imageContainer.layer.cornerRadius = imageContainer.frame.width / 2
        imageContainer.clipsToBounds = true
    }
}

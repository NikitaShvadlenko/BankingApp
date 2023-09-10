//
//  PrivacyOverlayView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class PrivacyOverlayView: UIView {

    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        let image = UIImage(asset: Asset.LaunchScreen.logo)
        imageView.image = image
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = .white
        label.text = L10n.OverlayScreen.appName
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

// MARK: - Private Methods
extension PrivacyOverlayView {
    private func setupView() {
        [
            logoView,
            titleLabel
        ].forEach(addSubview)

        backgroundColor = Asset.LaunchScreen.launchScreenBackground.color
        logoView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(137)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

    }
}

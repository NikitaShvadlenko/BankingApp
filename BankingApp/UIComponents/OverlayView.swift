//
//  OverlayView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit
import SnapKit

final class OverlayView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = Asset.Colors.secondaryLabel.color
        return label
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.style = .large
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.primaryBackground.color
        view.layer.cornerRadius = 10
        [
            titleLabel,
            activityIndicator,
            subtitleLabel
        ].forEach(view.addSubview)
        view.layer.borderWidth = 1.5
        view.layer.borderColor = Asset.Colors.primaryLabel.color.cgColor
        return view
    }()

    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private Methods
extension OverlayView {
    private func setupView() {
        backgroundColor = Asset.LaunchScreen.launchScreenBackground.color
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.2)
        }

        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(containerView)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView).offset(14)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(containerView)
            make.bottom.equalTo(containerView).inset(14)
        }
    }
}

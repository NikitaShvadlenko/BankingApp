//
//  ImageFirstLeadingConstraintStrategy.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct ImageFirstLeadingConstraintStrategy: ShareLabelConstraintStrategy {
    func setConstraints(containerView: UIView, label: UILabel, imageView: UIImageView) {
        label.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(containerView.snp.centerY)
        }

        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(label.snp.leading).offset(-2)
            make.leading.equalToSuperview()
            make.centerY.equalTo(label.snp.centerY)
        }
    }
}

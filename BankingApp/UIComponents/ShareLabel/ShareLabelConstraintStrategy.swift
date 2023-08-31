//
//  ShareLabelConstraintStrategy.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ShareLabelConstraintStrategy {
    func setConstraints(
        containerView: UIView,
        label: UILabel,
        imageView: UIImageView
    )
}

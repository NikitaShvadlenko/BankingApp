//
//  SeparatorView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 01.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class SeparatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.secondaryLabel.color.withAlphaComponent(0.4)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

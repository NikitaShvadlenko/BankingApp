//
//  ReviewAccountApplicationView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ReviewAccountApplicationView: OpenAccountView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension ReviewAccountApplicationView {
    private func configureViews() {
        backgroundColor = Asset.Colors.primaryBackground.color
    }
}

//
//  MenuItemCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class MenuItemCell: UICollectionViewCell {

    private lazy var menuItemButton: UIButton = {
        let button = UIButton()
        return button
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
        menuItemButton.setTitle(title, for: .normal)
        menuItemButton.setImage(image, for: .normal)
    }
}

// MARK: - Private Methods
extension MenuItemCell {
    private func setupView() {
        addSubview(menuItemButton)
        menuItemButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//
//  AccountSelectionCell.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountSelectionCell: UITableViewCell {

    private lazy var selectionImage: UIImage = {
        guard let image = UIImage(sfSymbol: SFSymbol.checkmark) else {
            return UIImage()
        }
        return image
    }()

    private lazy var selectionBox: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.tintColor = Asset.Colors.primaryBackground.color
        return view
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionBox.backgroundColor =
        selected ? Asset.Colors.applicationPageViewBackground.color : Asset.Colors.primaryBackground.color
        selectionBox.image = selected ? selectionImage : nil
        contentView.layer.borderWidth = selected ? 2 : 1
        contentView.layer.borderColor =
        selected ? Asset.Colors.secondaryLabel.color.cgColor:
        Asset.Colors.applicationPageViewBackground.color.cgColor
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = Asset.Colors.secondaryLabel.color.cgColor
        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension AccountSelectionCell {

}

// MARK: - Private Methods
extension AccountSelectionCell {
    private func setupView() {

    }
}

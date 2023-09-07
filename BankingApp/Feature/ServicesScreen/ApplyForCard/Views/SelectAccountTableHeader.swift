//
//  SelectAccountTableHeader.swift
//  BankingApp
//
//  Created by Nikita Shvad on 07.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit
import SnapKit

final class SelectAccountTableHeader: UITableViewHeaderFooterView {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = Asset.Colors.primaryLabel.color
        label.text = L10n.Application.tableHeader
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.backgroundColor = Asset.Colors.primaryBackground.color
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

// MARK: - Private Methods
extension SelectAccountTableHeader {
    private func setupView() {
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }
    }
}

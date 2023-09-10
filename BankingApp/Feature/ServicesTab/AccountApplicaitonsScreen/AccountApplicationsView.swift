//
//  AccountApplicationsView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class AccountApplicationsView: UIView {
     lazy var tableView: UITableView = {
         let tableView = UITableView()
         tableView.estimatedRowHeight = 44
         tableView.backgroundColor = Asset.Colors.primaryBackground.color
         tableView.register(
            AccountApplicationTableViewCell.self,
            forCellReuseIdentifier: "\(AccountApplicationTableViewCell.self)"
         )
         return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private Methods
extension AccountApplicationsView {
    private func setupView() {
        backgroundColor = Asset.Colors.primaryBackground.color
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

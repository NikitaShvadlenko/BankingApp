//
//  ChooseAccountView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ChooseAccountView: ApplyForCardView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 300
        tableView.separatorStyle = .none
        tableView.register(AccountSelectionCell.self, forCellReuseIdentifier: "\(AccountSelectionCell.self)")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChooseAccountView {
    private func setupView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

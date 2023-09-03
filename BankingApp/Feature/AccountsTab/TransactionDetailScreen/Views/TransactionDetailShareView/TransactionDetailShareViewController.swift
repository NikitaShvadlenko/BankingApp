//
//  TransactionDetailShareViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionDetailShareViewController: UIViewController {

    let viewModel: TransactionDetailViewModel
    let shareView = TransactionDetailShareView()

    override func loadView() {
        view = shareView
    }

    init(model: TransactionDetailViewModel) {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
        shareView.configure(with: model)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

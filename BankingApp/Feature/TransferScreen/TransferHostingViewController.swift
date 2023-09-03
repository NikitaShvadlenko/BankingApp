//
//  TransferScreenViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import SwiftUI

final class TransferHostingViewController: UIHostingController<TransferScreenView> {
    let transferView = TransferScreenView()
    init() {
        super.init(rootView: transferView)
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

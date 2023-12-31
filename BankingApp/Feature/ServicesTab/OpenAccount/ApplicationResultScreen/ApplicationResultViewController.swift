//
//  ApplicationResultViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ApplicationResultViewController: UIViewController {

    let applicationResultView = ApplicationResultView()
    var coordinator: Coordinator?
    weak var delegate: ApplicationResultDelegate?

    override func loadView() {
        view = applicationResultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }

    func setApplicationResultViewDelegate(delegate: ApplicationResultViewDelegate) {
        applicationResultView.delegate = delegate
    }
}
// MARK: - ApplicationResultViewDelegate
extension ApplicationResultViewController: ApplicationResultViewDelegate {
    func viewDidPressViewApplicationsButton(_ view: ApplicationResultView) {
        delegate?.viewDidSelectViewApplications(self)
    }

    func viewDidPressCloseButton(_ view: ApplicationResultView) {
        delegate?.viewDidSelectComplete(self)
    }
}

// MARK: - CoordinatorItem
extension ApplicationResultViewController: CoordinatorItem {
}

//
//  ReviewAccountApplicationViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class ReviewAccountApplicationViewController: OpenAccountViewController {

    weak var delegate: ReviewAccountApplicationDelegate?
    weak var coordinator: Coordinator?
    let reviewAccountApplicationView = ReviewAccountApplicationView()

    let accountName: String
    let taxResidencyStatus: String
    let dateOfBirth: Date

    init(accountName: String, taxResidencyStatus: String, dateOfBirth: Date) {
        self.accountName = accountName
        self.taxResidencyStatus = taxResidencyStatus
        self.dateOfBirth = dateOfBirth
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func loadView() {
        view = reviewAccountApplicationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewAccountApplicationView.configure(
            accountName: accountName,
            taxResidencyStatus: taxResidencyStatus,
            dateOfBirth: dateOfBirth
        )
    }
}

// MARK: - OpenAccountCoordinatorItem
extension ReviewAccountApplicationViewController: OpenAccountCoordinatorItem {
    func setViewController(selectedPageNumber: Int, numberOfPages: Int) {
        reviewAccountApplicationView.configureView(
            title: L10n.Application.reviewAndConfirmTitle,
            pageNumber: selectedPageNumber,
            totalPages: numberOfPages,
            pageTitle: L10n.Application.reviewAndConfirm
        )
    }
}

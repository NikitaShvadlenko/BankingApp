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
    override func loadView() {
        view = reviewAccountApplicationView
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

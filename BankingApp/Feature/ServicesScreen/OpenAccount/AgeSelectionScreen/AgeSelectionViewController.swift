//
//  AgeSelectionViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class AgeSelectionViewController: OpenAccountViewController {

    weak var coordinator: Coordinator?
    weak var delegate: AgeSelectionDelegate?

    let ageSelectionView = AgeSelectionView()

    override func loadView() {
        view = ageSelectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AgeSelectionViewController: OpenAccountCoordinatorItem {
    func setViewController(selectedPageNumber: Int, numberOfPages: Int) {
        ageSelectionView.configureView(
            title: L10n.Application.openAnAccount,
            pageNumber: selectedPageNumber,
            totalPages: numberOfPages,
            pageTitle: L10n.Application.ageCheck
        )
    }
}

// MARK: - Private methods
extension AgeSelectionViewController {
}

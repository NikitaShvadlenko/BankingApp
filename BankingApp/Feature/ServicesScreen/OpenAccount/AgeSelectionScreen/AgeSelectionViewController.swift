//
//  AgeSelectionViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class AgeSelectionViewController: OpenAccountViewController {

    private var selectedDate: Date?
    weak var coordinator: Coordinator?
    weak var delegate: AgeSelectionDelegate?

    let ageSelectionView = AgeSelectionView()

    override func loadView() {
        view = ageSelectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setAgeSelectionViewDelegate(_ delegate: AgeSelectionViewDelegate) {
        ageSelectionView.delegate = delegate
    }
}

// MARK: - AgeSelectionViewDelegate
extension AgeSelectionViewController: AgeSelectionViewDelegate {
    func viewDidPressNextButton(_ veiw: AgeSelectionView) {
        guard let selectedDate else { return }
        delegate?.viewDidSelectDateOfBirth(self, dateOfBirth: selectedDate)
    }

    func viewDidPressPreviousButton(_ veiw: AgeSelectionView) {
        navigationController?.popViewController(animated: true)
    }

    func viewDidSelectDate(_ view: AgeSelectionView, date: Date) {
        selectedDate = date
        ageSelectionView.isNextButtonEnabled = true
    }
}

// MARK: - OpenAccountCoordinatorItem
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

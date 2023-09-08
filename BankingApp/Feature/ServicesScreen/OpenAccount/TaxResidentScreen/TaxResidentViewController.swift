//
//  TaxResidentViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TaxResidentViewController: OpenAccountViewController {
    let taxResidentView = TaxResidentView()
    weak var coordinator: Coordinator?

    override func loadView() {
        view = taxResidentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setTaxResidentViewDelegate(_ delegate: TaxResidentViewDelegate) {
        taxResidentView.delegate = delegate
    }
}

// MARK: - TaxResidentViewDelegate
extension TaxResidentViewController: TaxResidentViewDelegate {
    func viewDidPressNextButton(_ view: TaxResidentView) {
        print("Next button pressed")
    }

    func viewDidPressPreviousButton(_ view: TaxResidentView) {
        navigationController?.popViewController(animated: true)
    }

    func selectionView(_ selectionView: SelectionView, didSelectOption: SelectionViewOption) {
        print("Option selected")
    }
}

// MARK: - OpenAccountCoordinatorItem
extension TaxResidentViewController: OpenAccountCoordinatorItem {
    func setViewController(selectedPageNumber: Int, numberOfPages: Int) {
        taxResidentView.configureView(
            title: L10n.Application.openAnAccount,
            pageNumber: selectedPageNumber,
            totalPages: numberOfPages,
            pageTitle: L10n.Application.residencyStatus
        )
    }
}

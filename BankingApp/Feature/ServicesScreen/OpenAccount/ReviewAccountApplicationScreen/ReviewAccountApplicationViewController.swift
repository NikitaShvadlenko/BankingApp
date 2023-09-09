//
//  ReviewAccountApplicationViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ReviewAccountApplicationViewController: OpenAccountViewController {

    weak var delegate: ReviewAccountApplicationDelegate?
    weak var coordinator: Coordinator?
    let reviewAccountApplicationView = ReviewAccountApplicationView()
    var didAcceptTerms = false

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

    func setReviewApplicationViewDelegate(_ delegate: ReviewAccountApplicationDisclaimerViewDelegate) {
        reviewAccountApplicationView.reviewAccountApplicationDisclaimerView.delegate = delegate
    }
}

// MARK: - ReviewAccountApplicationDisclaimerViewDelegate
extension ReviewAccountApplicationViewController: ReviewAccountApplicationDisclaimerViewDelegate {
    func reviewAccountApplicationDisclaimerViewDidTriggerBox(
        _ view: ReviewAccountApplicationDisclaimerView,
        isSelected: Bool
    ) {
        didAcceptTerms = isSelected
    }

    func reviewAccountApplicationDisclaimerView(
        _ view: ReviewAccountApplicationDisclaimerView,
        didTapOpenAccountButton button: UIButton
    ) {
        if didAcceptTerms {
            delegate?.reviewAccountApplicationView(self, didReviewTerms: true)
        } else {
            presentAcceptAlert()
        }
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

// MARK: - Private Methods
extension ReviewAccountApplicationViewController {
    func presentAcceptAlert() {
        let controller = UIAlertController(
            title: L10n.TermsAlert.title,
            message: L10n.TermsAlert.message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: L10n.TermsAlert.close, style: .default) { _ in
            controller.dismiss(animated: true)
        }
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}

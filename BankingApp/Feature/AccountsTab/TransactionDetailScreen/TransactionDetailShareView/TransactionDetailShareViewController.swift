//
//  TransactionDetailShareViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TransactionDetailShareViewController: UIViewController {

    private let viewModel: TransactionDetailViewModel
    private let shareView = TransactionDetailShareView()
    private let barSeparatorView = SeparatorView()

    init(model: TransactionDetailViewModel) {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
        shareView.configure(with: model)
        setRightButtonItem()
        setupView()
        addSeparatorView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private Methods
extension TransactionDetailShareViewController {

    private func setupView() {
        view.addSubview(shareView)
        shareView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func addSeparatorView() {
        view.addSubview(barSeparatorView)
        barSeparatorView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    func setRightButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: L10n.TransactionDetailSharePage.share,
            style: .plain,
            target: self,
            action: #selector(shareButtonPressed)
        )
    }

    @objc
    private func shareButtonPressed() {
        let renderer = UIGraphicsImageRenderer(size: shareView.bounds.size)
        let image = renderer.image { _ in
            shareView.drawHierarchy(in: shareView.bounds, afterScreenUpdates: true)
        }
        let activityViewController = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = view.bounds
        }
        present(activityViewController, animated: true)
    }
}

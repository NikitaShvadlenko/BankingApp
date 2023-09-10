//
//  OpenAccountViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 07.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

class OpenAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
    }

    private func setBackButton() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: L10n.Application.cancel,
            style: .plain,
            target: self,
            action: #selector(viewDidPressCancel)
        )
    }

    @objc
    private func viewDidPressCancel() {
        let alertController = UIAlertController(
            title: L10n.CloseAlert.title,
            message: L10n.CloseAlert.message,
            preferredStyle: .alert
        )

        let leaveAction = UIAlertAction(title: L10n.CloseAlert.leave, style: .default) { [weak self] _ in
            self?.navigationController?.dismiss(animated: true)
        }

        let stayAction = UIAlertAction(title: L10n.CloseAlert.stay, style: .cancel)

        alertController.addAction(stayAction)
        alertController.addAction(leaveAction)
        present(alertController, animated: true)
    }
}

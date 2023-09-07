//
//  FormViewController.swift
//  BankingApp
//
//  Created by Nikita Shvad on 07.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

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
        print("Cancel")
    }
}

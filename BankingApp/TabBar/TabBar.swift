//
//  TabBar.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)
        delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        if viewController.isKind(of: TransferHostingViewController.self) {
            let transferViewController =  TransferHostingViewController()
            transferViewController.modalPresentationStyle = .fullScreen
            self.present(transferViewController, animated: true, completion: nil)
            return false
        }
        return true
    }
}

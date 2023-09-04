//
//  ServicesCoordinator.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ApplyForCardCoordinator: Coordinator {

    var parentViewController: UIViewController

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }

    let viewController = UIViewController()
    func start() {
        viewController.view.backgroundColor = .red
        parentViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}

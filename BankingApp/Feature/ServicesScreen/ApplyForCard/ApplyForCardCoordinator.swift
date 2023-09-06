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

    func start() {
        let selectAccountViewController = SelectAccountAssembly.assemble(coordinator: self)
        parentViewController.navigationController?.pushViewController(selectAccountViewController, animated: true)
    }
}

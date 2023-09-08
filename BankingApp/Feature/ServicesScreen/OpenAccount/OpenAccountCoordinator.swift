//
//  ServicesCoordinator.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class OpenAccountCoordinator: Coordinator {

    var parentViewController: UIViewController
    var interactor: OpenAccountInteractorProtocol?

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }

    func start() {
        let selectAccountViewController = SelectAccountAssembly.assemble(
            coordinator: self,
            delegate: self
        )
        selectAccountViewController.setViewController(selectedPageNumber: 1, numberOfPages: 3)
        parentViewController.navigationController?.pushViewController(selectAccountViewController, animated: true)
    }
}

extension OpenAccountCoordinator: SelectAccountDelegate {
    func selectAccountViewDidSelectAccountOption(_ accountOption: ApplicationAccountDescription) {
        interactor?.addAccountDetails(accountOption)
    }
}

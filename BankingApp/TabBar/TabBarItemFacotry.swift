//
//  TabBarItemFacotry.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct TabBarItemFactory {

    static func viewController(for tabBarItemType: TabBarItemType) -> UIViewController {
        switch tabBarItemType {
        case .accounts:
            return accountsViewController()
        case .payments:
            return paymentsViewController()
        case .transfer:
            return transferViewController()
        case .services:
            return servicesViewController()
        case .settings:
            return settingsViewController()
        }
    }
}

// MARK: - ViewControllerImplementation
extension TabBarItemFactory {
    private static func accountsViewController() -> UIViewController {
        let accountsScreenViewController = AccountsScreenAssembly.assemble().viewController
        let accountsScreenNavigationController = UINavigationController(
            rootViewController: accountsScreenViewController
        )

        accountsScreenNavigationController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.accounts,
            image: UIImage(sfSymbol: SFSymbol.home),
            selectedImage: UIImage(sfSymbol: SFSymbol.home)
        )

        return accountsScreenNavigationController
    }

    private static func paymentsViewController() -> UIViewController {
        let paymentsViewController = PaymentsScreenAssembly.assemble().viewController
        paymentsViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.payments,
            image: UIImage(sfSymbol: SFSymbol.dollarSign),
            selectedImage: UIImage(sfSymbol: SFSymbol.dollarSign)
        )
        return paymentsViewController
    }

    private static func transferViewController() -> UIViewController {
        let transferViewController = TransferScreenAssembly.assemble().viewController
        transferViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.transfer,
            image: UIImage(sfSymbol: SFSymbol.transfer),
            selectedImage: UIImage(sfSymbol: SFSymbol.transfer)
        )
        return transferViewController
    }

    private static func servicesViewController() -> UIViewController {
        let servicesViewController = ServicesScreenAssembly.assemble().viewController
        servicesViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.services,
            image: UIImage(sfSymbol: SFSymbol.services),
            selectedImage: UIImage(sfSymbol: SFSymbol.services)
        )
        return servicesViewController
    }

    private static func settingsViewController() -> UIViewController {
        let settingsViewController = SettingsScreenAssembly.assemble().viewController
        settingsViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.settings,
            image: UIImage(sfSymbol: SFSymbol.settings),
            selectedImage: UIImage(sfSymbol: SFSymbol.settings)
        )
        return settingsViewController
    }
}

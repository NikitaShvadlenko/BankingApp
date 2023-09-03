//
//  TabBarItemFacotry.swift
//  BankingApp
//
//  Created by Nikita Shvad on 26.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit
import SwiftUI

struct TabBarItemFactory {
    static let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .light, scale: .large)
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
            image: UIImage(sfSymbol: SFSymbol.home, withConfiguration: configuration),
            selectedImage: UIImage(sfSymbol: SFSymbol.home, withConfiguration: configuration)
        )

        return accountsScreenNavigationController
    }

    private static func paymentsViewController() -> UIViewController {
        let paymentsViewController = PaymentsScreenAssembly.assemble().viewController
        paymentsViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.payments,
            image: UIImage(sfSymbol: SFSymbol.dollarSign, withConfiguration: configuration),
            selectedImage: UIImage(sfSymbol: SFSymbol.dollarSign, withConfiguration: configuration)
        )
        return paymentsViewController
    }

    private static func transferViewController() -> UIViewController {
        let transferViewController = TransferHostingViewController()
        transferViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.transfer,
            image: UIImage(sfSymbol: SFSymbol.transfer, withConfiguration: configuration),
            selectedImage: UIImage(sfSymbol: SFSymbol.transfer, withConfiguration: configuration)
        )
        return transferViewController
    }

    private static func servicesViewController() -> UIViewController {
        let servicesViewController = ServicesScreenAssembly.assemble().viewController
        servicesViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.services,
            image: UIImage(sfSymbol: SFSymbol.services, withConfiguration: configuration),
            selectedImage: UIImage(sfSymbol: SFSymbol.services, withConfiguration: configuration)
        )
        return servicesViewController
    }

    private static func settingsViewController() -> UIViewController {
        let settingsViewController = SettingsScreenAssembly.assemble().viewController
        settingsViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.settings,
            image: UIImage(sfSymbol: SFSymbol.settings, withConfiguration: configuration),
            selectedImage: UIImage(sfSymbol: SFSymbol.settings, withConfiguration: configuration)
        )
        return settingsViewController
    }
}

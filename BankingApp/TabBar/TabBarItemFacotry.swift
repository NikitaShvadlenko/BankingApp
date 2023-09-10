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
        case .transfer:
            return transferViewController()
        case .services:
            return servicesViewController()
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
        let servicesViewController = ServicesScreenAssembly.assemble()
        servicesViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.services,
            image: UIImage(sfSymbol: SFSymbol.services, withConfiguration: configuration),
            selectedImage: UIImage(sfSymbol: SFSymbol.services, withConfiguration: configuration)
        )
        return servicesViewController
    }
}

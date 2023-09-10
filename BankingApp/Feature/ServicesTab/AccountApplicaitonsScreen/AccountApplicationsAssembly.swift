//
//  AccountApplicationsAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum AccountApplicationsAssembly {
    static func assemble() -> UIViewController {
        let viewController = AccountApplicationsViewController()
        return viewController
    }
}

//
//  TaxResidentAssembly.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

enum TaxResidentAssembly {
    static func assemble() -> OpenAccountCoordinatorItem {
        let viewController = TaxResidentViewController()

        return viewController
    }
}


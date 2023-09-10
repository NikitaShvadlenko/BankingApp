//
//  ApplicationResultDelegate.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol ApplicationResultDelegate: AnyObject {
    func viewDidSelectViewApplications(_ view: ApplicationResultViewController)
    func viewDidSelectComplete(_ view: ApplicationResultViewController)
}

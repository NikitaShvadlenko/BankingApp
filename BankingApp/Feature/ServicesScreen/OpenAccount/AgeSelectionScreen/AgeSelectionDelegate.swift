//
//  AgeSelectionDelegate.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol AgeSelectionDelegate: AnyObject {
    func viewDidSelectDateOfBirth(_ view: AgeSelectionViewController, dateOfBirth: Date)
}

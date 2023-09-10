//
//  SelectAccountDelegate.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol SelectAccountDelegate: AnyObject {
    func selectAccountViewDidSelectAccountOption(_ accountOption: ApplicationAccountDescription)
}

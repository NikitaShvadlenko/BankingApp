//
//  TaxResidentDelegate.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation
protocol TaxResidentDelegate: AnyObject {
    func taxResidentView(_ taxResidentView: TaxResidentViewController, didSelectOption option: SelectionViewOption)
}

//
//  ProvidesAccountApplicationDescription.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol ProvidesAccountApplicationDescription {
     func fetchApplicationDescription() -> [ApplicationAccountDescription]
}

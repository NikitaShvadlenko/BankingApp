//
//  Coordinator.swift
//  BankingApp
//
//  Created by Nikita Shvad on 04.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
}

protocol CoordinatorItem: UIViewController {
    var coordinator: Coordinator? { get set }
}

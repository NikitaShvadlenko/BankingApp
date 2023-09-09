//
//  ReviewAccountApplicationDelegate.swift
//  BankingApp
//
//  Created by Nikita Shvad on 09.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol ReviewAccountApplicationDelegate: AnyObject {
    func reviewAccountApplicationView(_ view: ReviewAccountApplicationViewController, didReviewTerms didAccept: Bool)
}

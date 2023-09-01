//
//  ScrollView+Extensions.swift
//  BankingApp
//
//  Created by Nikita Shvad on 30.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToPage(pageNumber: Int, animated: Bool) {
        let nextVisible = CGRect(
            x: frame.size.width * CGFloat(pageNumber),
            y: frame.origin.y,
            width: frame.size.width,
            height: frame.size.height
        )
        scrollRectToVisible(nextVisible, animated: animated)
    }
}

//
//  ExtendedHitButton.swift
//  BankingApp
//
//  Created by Nikita Shvad on 10.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class ExtendedHitButton: UIButton {
   private var hitTestEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: -20, left: -20, bottom: -20, right: -20)

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}

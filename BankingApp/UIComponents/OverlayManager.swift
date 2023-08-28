//
//  AddsOverlayView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesOverlay {
    func presentOverlayView(_ view: UIView)
    func removeOverlayView(_ view: UIView)
}

final class OverlayManager: ManagesOverlay {

    private static var sharedManager: OverlayManager = {
        return OverlayManager()
    }()

    private var overlayView: UIView?

    static var shared: OverlayManager {
        return sharedManager
    }

    private init() {}

    func presentOverlayView(_ view: UIView) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window
        else {
            return
        }

        overlayView = view
        view.frame = window.bounds
        window.addSubview(view)
        window.bringSubviewToFront(view)
    }

    func removeOverlayView(_ view: UIView) {
        overlayView?.removeFromSuperview()
    }
}

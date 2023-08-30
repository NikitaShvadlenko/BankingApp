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
    func removeOverlayView()
}

final class OverlayManager: ManagesOverlay {

    private var overlayView: UIView?

    static let shared = OverlayManager()

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

    func removeOverlayView() {
        guard let overlayView = overlayView else {
            return
        }

        UIView.animate(withDuration: 0.2) {
            overlayView.alpha = 0
        } completion: { _ in
            overlayView.removeFromSuperview()
            self.overlayView = nil
        }
    }
}

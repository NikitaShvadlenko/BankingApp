//
//  SegmentedView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 29.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

public protocol SegmentedControlDelegate: AnyObject {
    func segmentedControlDidChangeValue(_ segmentedControl: SegmentedControl)
}

public class SegmentedControl: UISegmentedControl {

    private let buttonBar = UIView()

    public weak var delegate: SegmentedControlDelegate?

    public init(frame: CGRect, selected: UIColor, normal: UIColor, height: CGFloat) {
        super.init(frame: frame)
        setTitleAttributes(selected: selected, normal: normal)
        setBackground(height: height)
        setButtonBar(color: selected)
        addTarget(self, action: #selector(itemSelected), for: .valueChanged)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SegmentedControl {
    private func setTitleAttributes(selected: UIColor, normal: UIColor) {
        setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: normal],
            for: .normal)

        setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: selected],
            for: .selected)
    }

    private func setButtonBar(color: UIColor) {
        addSubview(buttonBar)
        buttonBar.backgroundColor = color
        buttonBar.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview()
            make.height.equalTo(5)
            make.width.equalTo(100)
            if numberOfSegments > 0 {
                make.width.equalToSuperview().multipliedBy(1/numberOfSegments)
            }
        }
    }

    private func setBackground(height: CGFloat) {
        let backgroundImage = UIImage(color: .clear, height: height, width: 1)
        let dividerImage = UIImage(color: .clear, height: 1, width: 1)
        setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        setDividerImage(dividerImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    func createWhiteImage(width: CGFloat) -> UIImage? {
        let size = CGSize(width: width, height: 20)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }

        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            return image
        }
        return nil
    }

    @objc
    private func itemSelected() {
        guard numberOfSegments > 0 else { return }
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            self.buttonBar.frame.origin.x =
            (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        }
        delegate?.segmentedControlDidChangeValue(self)
    }
}

extension UIImage {
    convenience init(color: UIColor, height: CGFloat, width: CGFloat) {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}

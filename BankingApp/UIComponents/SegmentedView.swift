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

    private let segmentsNumber: Int
    private let buttonBar = UIView()
    public weak var delegate: SegmentedControlDelegate?

    public init(frame: CGRect, selected: UIColor, normal: UIColor, height: CGFloat, numberOfSegments: Int) {
        self.segmentsNumber = numberOfSegments
        super.init(frame: frame)
        setTitleAttributes(selected: selected, normal: normal)
        setBackground(height: height)
        setButtonBar(color: selected)
        addTarget(self, action: #selector(itemSelected), for: .valueChanged)
        layer.cornerRadius = 0
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
        let numberOfSegments = segmentsNumber
        buttonBar.backgroundColor = color
        buttonBar.snp.remakeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(2)
            make.width.equalToSuperview().dividedBy(numberOfSegments)
        }
    }

    private func setBackground(height: CGFloat) {
        let backgroundImage = UIImage(color: .clear, height: height, width: 1)
        let dividerImage = UIImage(color: .clear, height: 1, width: 1)
        setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        setDividerImage(dividerImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    @objc
    private func itemSelected() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            let targetX = (self.frame.width / CGFloat(self.segmentsNumber)) * CGFloat(self.selectedSegmentIndex)
            let translationX = targetX - self.buttonBar.frame.origin.x
            self.buttonBar.transform = self.buttonBar.transform.translatedBy(x: translationX, y: 0)
        }

        delegate?.segmentedControlDidChangeValue(self)
    }
}

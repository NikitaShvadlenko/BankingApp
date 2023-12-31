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

    private var barPosition: CGFloat?
    private let buttonBar = UIView()

    public weak var delegate: SegmentedControlDelegate? {
        didSet {
            itemSelected()
        }
    }

    public var items: [SegmentedControlItem] = []

    public init(frame: CGRect, selected: UIColor, normal: UIColor, height: CGFloat, font: UIFont) {

        super.init(frame: frame)
        setTitleAttributes(selected: selected, normal: normal, font: font)
        setBackground(height: height)
        setButtonBar(color: selected)
        addTarget(self, action: #selector(itemSelected), for: .valueChanged)
        layer.cornerRadius = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func insertSegment(action: UIAction, at segment: Int, animated: Bool) {
        super.insertSegment(action: action, at: segment, animated: animated)
        selectedSegmentIndex = 0
        remakeButtonBarConstraints()
    }

    public override func insertSegment(with image: UIImage?, at segment: Int, animated: Bool) {
        super.insertSegment(with: image, at: segment, animated: animated)
        selectedSegmentIndex = 0
        remakeButtonBarConstraints()
    }

    public override func insertSegment(withTitle title: String?, at segment: Int, animated: Bool) {
        super.insertSegment(withTitle: title, at: segment, animated: animated)
        selectedSegmentIndex = 0
        remakeButtonBarConstraints()
    }

    public override func removeSegment(at segment: Int, animated: Bool) {
        super.removeSegment(at: segment, animated: animated)
        items.remove(at: segment)
    }

    public func insertSegmentItem(_ item: SegmentedControlItem) {
        items.append(item)
        insertSegment(withTitle: item.title, at: items.count - 1, animated: false)
    }

    public func changeSelectionBarPosition(offsetPercentage: Double) {
        let width = frame.size.width / CGFloat(numberOfSegments)
        let offsetToApply = width * offsetPercentage / 100

        let newXPosition = CGFloat(offsetToApply)
        buttonBar.frame.origin.x = newXPosition
        barPosition = newXPosition
    }

    public func selectedItem() -> SegmentedControlItem? {
        if items.count >= selectedSegmentIndex {
            return items[selectedSegmentIndex]
        } else {
            return nil
        }
    }

    public func indexForItem(item: SegmentedControlItem) -> Int? {
        return items.firstIndex(where: { $0 == item })
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        guard let barPosition else { return }
        buttonBar.frame.origin.x = barPosition
    }
}

extension SegmentedControl {
    private func setTitleAttributes(selected: UIColor, normal: UIColor, font: UIFont) {
        setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: normal,
             NSAttributedString.Key.font: font
            ],
            for: .normal)

        setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: selected,
             NSAttributedString.Key.font: font
            ],
            for: .selected)
    }

    private func setButtonBar(color: UIColor) {
        addSubview(buttonBar)
        let numberOfSegments = numberOfSegments
        buttonBar.backgroundColor = color
        buttonBar.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(2)
            if numberOfSegments > 0 {
                make.width.equalToSuperview().dividedBy(numberOfSegments)
            } else {
                make.width.equalToSuperview()
            }
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
        delegate?.segmentedControlDidChangeValue(self)
    }

    private func remakeButtonBarConstraints() {
        buttonBar.snp.remakeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(2)
            if numberOfSegments > 0 {
                make.width.equalToSuperview().dividedBy(numberOfSegments)
            } else {
                make.width.equalToSuperview()
            }
        }
    }
}

extension SegmentedControl {
   public enum SegmentedControlItem {
        case transactionsTab
        case accountDetailsTab

        var title: String {
            switch self {
            case .transactionsTab:
                return L10n.AccountDetail.transactions
            case .accountDetailsTab:
                return L10n.AccountDetail.accountDetails
            }
        }
    }
}

import UIKit

final class ServicesScreenView: UIView {

    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

// MARK: - Private methods
extension ServicesScreenView {
    private func configureViews() {

        gradientLayer.colors = [
            Asset.Colors.gradientBackgroundStart.color.cgColor,
            Asset.Colors.gradientBackgroundEnd.color.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: bounds.origin.x / 2, y: 0)
        gradientLayer.endPoint = CGPoint(x: bounds.origin.x / 2, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

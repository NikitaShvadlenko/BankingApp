import UIKit

final class ServicesScreenView: UIView {

    private let gradientLayer = CAGradientLayer()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: "\(MenuItemCell.self)")
        return collectionView
    }()

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
        layout.minimumInteritemSpacing = 10
        return layout
    }()

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
        addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        gradientLayer.colors = [
            Asset.Colors.gradientBackgroundStart.color.cgColor,
            Asset.Colors.gradientBackgroundEnd.color.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: bounds.origin.x / 2, y: 0)
        gradientLayer.endPoint = CGPoint(x: bounds.origin.x / 2, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

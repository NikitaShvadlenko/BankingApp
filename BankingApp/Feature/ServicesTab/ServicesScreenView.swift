import UIKit

protocol CloseButtonDelegate: AnyObject {
    func buttonPressed(_ button: UIButton)
}

final class ServicesScreenView: UIView {

    weak var delegate: CloseButtonDelegate?

    private let gradientLayer = CAGradientLayer()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.tintColor = Asset.Colors.primaryBackground.color
        button.setTitle(L10n.ServicesScreen.close, for: .normal)
        button.setImage(UIImage(sfSymbol: SFSymbol.xmark), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()

     lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: "\(MenuItemCell.self)")
        return collectionView
    }()

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth: CGFloat =
        (screenWidth -
        (Constants.interitemSpacing * Constants.numberOfSpaces) -
        (Constants.horizontalInsets * 2))
        / Constants.numberOfItemsHorizontal
        layout.itemSize = CGSize(width: itemWidth, height: 80)
        layout.sectionInset = UIEdgeInsets(
            top: screenHeight/4,
            left: Constants.horizontalInsets,
            bottom: 10,
            right: Constants.horizontalInsets
        )
        layout.minimumInteritemSpacing = Constants.interitemSpacing
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
        addSubview(closeButton)

        closeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(10)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(closeButton.snp.top)
        }

        gradientLayer.colors = [
            Asset.Colors.gradientBackgroundStart.color.cgColor,
            Asset.Colors.gradientBackgroundEnd.color.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: bounds.origin.x / 2, y: 0)
        gradientLayer.endPoint = CGPoint(x: bounds.origin.x / 2, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }

    @objc
    func closeButtonPressed() {
        delegate?.buttonPressed(closeButton)
    }
}

extension ServicesScreenView {
    enum Constants {
        static let numberOfItemsHorizontal: CGFloat = 3
        static let interitemSpacing: CGFloat = 10
        static let itemHeight: CGFloat = 100
        static let horizontalInsets: CGFloat = 20
        static var numberOfSpaces: CGFloat {
            return max(0, Constants.numberOfItemsHorizontal - 1)
        }
    }
}

import UIKit

final class TransactionDetailScreenView: UIView {

    lazy var transactionsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(
            TransactionCollectionViewCell.self,
            forCellWithReuseIdentifier: "\(TransactionCollectionViewCell.self)"
        )
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        return collectionView
    }()

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()

    lazy var pageView = TransactionPagingView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension TransactionDetailScreenView {
    private func configureViews() {
        backgroundColor = Asset.Colors.primaryBackground.color
        addSubview(transactionsCollectionView)
        addSubview(pageView)

        pageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(14)
        }

        transactionsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.center.equalToSuperview()
            make.bottom.equalTo(pageView.snp.top)
        }
    }
}

import UIKit

final class TransactionDetailScreenView: UIView {

    let transactionsCollectionView: UICollectionView = {
        let collectionView = UICollectionView()

        return collectionView
    }()

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

    }
}

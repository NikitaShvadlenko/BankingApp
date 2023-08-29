import UIKit
import SnapKit

final class AccountDetailScreenView: UIView {
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = L10n.AccountDetail.searchTransactions
        searchBar.autocorrectionType = .no
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    let accountDetailView = AccountDetailView()

    lazy var segmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl(
            frame: .zero,
            selected: Asset.Colors.segmentedControlSelector.color,
            normal: Asset.Colors.secondaryLabel.color,
            height: 35,
            font: UIFont.systemFont(ofSize: 16)
        )
        segmentedControl.insertSegment(withTitle: L10n.AccountDetail.transactions, at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: L10n.AccountDetail.accountDetails, at: 1, animated: false)
        return segmentedControl
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
extension AccountDetailScreenView {
    private func configureViews() {
        backgroundColor = .white
        addSubview(searchBar)
        addSubview(accountDetailView)
        addSubview(segmentedControl)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(14)
        }

        accountDetailView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }

        segmentedControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(accountDetailView.snp.bottom)
        }
    }
}

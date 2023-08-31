import UIKit
import SnapKit

protocol SegmentedSelectionScrollDelegate: AnyObject {
    func scrollViewDidChangePage(pageNumber: Int)
    func scrollViewDidScroll(percentage: Double)
}

final class AccountDetailScreenView: UIView {

    var lastPageNumber: Int = 0
    let accountDetailPageView = UIView()
    let accountDetailView = AccountDetailView()
    var imageHeight: NSLayoutConstraint?
    var searchBarHeight: NSLayoutConstraint?
    var segmentedControlHeight: NSLayoutConstraint?
    weak var segmentedSelectionScrollDelegate: SegmentedSelectionScrollDelegate?

    lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var segmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl(
            frame: .zero,
            selected: Asset.Colors.segmentedControlSelector.color,
            normal: Asset.Colors.secondaryLabel.color,
            height: 35,
            font: UIFont.systemFont(ofSize: 16)
        )
        segmentedControl.backgroundColor = UIColor(asset: Asset.Colors.primaryBackground)
        segmentedControl.insertSegmentItem(.transactionsTab)
        segmentedControl.insertSegmentItem(.accountDetailsTab)
        return segmentedControl
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: "\(TransactionTableViewCell.self)")
        tableView.rowHeight = 40
        tableView.register(
            TransactionsTableHeader.self,
            forHeaderFooterViewReuseIdentifier: "\(TransactionsTableHeader.self)"
        )
        tableView.sectionHeaderTopPadding = 10
        tableView.sectionHeaderHeight = 30
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(scrollViewContentView)
        scrollView.delegate = self
        return scrollView
    }()

    private lazy var scrollViewContentView: UIView = {
        let contentView = UIView()
        contentView.addSubview(tableView)
        contentView.addSubview(accountDetailPageView)
        return contentView
    }()

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = L10n.AccountDetail.searchTransactions
        searchBar.autocorrectionType = .no
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()

        segmentedControlHeight = segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        segmentedControlHeight?.isActive = true
        
        searchBarHeight = searchBar.heightAnchor.constraint(equalToConstant: 0)
        searchBarHeight?.isActive = true

        imageHeight = accountImageView.heightAnchor.constraint(equalToConstant: 155)
        imageHeight?.isActive = true

    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UIScrollViewDelegate
extension AccountDetailScreenView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let fullWidth = scrollView.contentSize.width
        let contentOffset = scrollView.contentOffset.x
        let scrollPercentage = (contentOffset / (fullWidth - scrollView.bounds.width)) * 100
        segmentedSelectionScrollDelegate?.scrollViewDidScroll(percentage: scrollPercentage)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        let pageNumber = Int(offset / scrollView.bounds.width)

        if pageNumber != lastPageNumber {
            segmentedSelectionScrollDelegate?.scrollViewDidChangePage(pageNumber: pageNumber)
            lastPageNumber = pageNumber
        }
    }
}

// MARK: - Private methods
extension AccountDetailScreenView {
    private func configureViews() {
        backgroundColor = Asset.Colors.primaryBackground.color
        addSubview(accountDetailView)
        addSubview(searchBar)
        addSubview(segmentedControl)
        addSubview(scrollView)
        addSubview(accountImageView)

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(14)
        }

        accountImageView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).priority(.low)
            make.leading.trailing.equalToSuperview()
        }

        accountDetailView.snp.makeConstraints { make in
            make.center.equalTo(accountImageView).priority(.low)
            make.top.greaterThanOrEqualTo(safeAreaLayoutGuide.snp.topMargin)
            make.width.equalTo(200).priority(.high)
            make.height.equalTo(120).priority(.high)
        }

        segmentedControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(accountImageView.snp.bottom)
        }


        scrollView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.width.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.width.equalTo(UIScreen.main.bounds.width)
        }

        scrollViewContentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollView)
            make.width.equalTo(scrollView).multipliedBy(2)
        }

        accountDetailPageView.snp.makeConstraints { make in
            make.leading.equalTo(tableView.snp.trailing)
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(tableView)
        }
        accountDetailView.layer.zPosition = -1
        accountImageView.layer.zPosition = -2
    }
}

import UIKit

final class AccountDetailScreenViewController: UIViewController {

    private let accountDetailScreenView = AccountDetailScreenView()

    var presenter: AccountDetailScreenViewOutput?
    private var isSearching: Bool = false

    override func loadView() {
        view = accountDetailScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        navigationItem.backButtonTitle = ""
    }

    func setAccountsViewDelegate() {
        accountDetailScreenView.accountDetailView.setDelegate(delegate: self)
        accountDetailScreenView.segmentedControl.delegate = self
        accountDetailScreenView.segmentedSelectionScrollDelegate = self
        accountDetailScreenView.searchBar.delegate = self
        accountDetailScreenView.accountDetailPageView.delegate = self
    }

    func setTableViewManager(_ tableViewManager: ManagesTransactionsTableView) {
        tableViewManager.setScrollDelegate(self)
        accountDetailScreenView.tableView.delegate = tableViewManager
        tableViewManager.setTableView(accountDetailScreenView.tableView)
        accountDetailScreenView.tableView.dataSource = tableViewManager.dataSource
    }
}

// MARK: - AccountDetailPageViewDelegate
extension AccountDetailScreenViewController: AccountDetailPageViewDelegate {
    func accountDetailPagescrollView(_ transactionsTableScrollView: UIScrollView, offset offsetY: CGFloat) {
        handleVerticalScroll(offsetY: offsetY)
    }
}

// MARK: - AccountDetailScreenViewInput
extension AccountDetailScreenViewController: AccountDetailScreenViewInput {
    func setNavigationBarTitle(newTitle: String) {
        title = newTitle
    }

    func setAccountView(with model: AccountViewModel) {
        accountDetailScreenView.accountDetailView.configureView(
            accountNumber: model.accountNumber,
            amount: model.amount,
            availible: model.availible
        )
        accountDetailScreenView.accountDetailPageView.configureView(name: model.accountName, type: model.accountType)
        accountDetailScreenView.accountImageView.image = UIImage(data: model.image)
    }

    func configureViews() {
        setRightButtonItems(includingSearchButton: true)
    }
}

// MARK: - SearchBarDelegate
extension AccountDetailScreenViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.viewDidSearch(self, text: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        accountDetailScreenView.searchBar.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        accountDetailScreenView.searchBar.text = ""
        presenter?.viewDidSearch(self, text: "")
        isSearching = false
        accountDetailScreenView.searchBar.endEditing(true)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        triggerSearchLayout()
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard !self.isSearching else { return }
        triggerDefaultLayout()
    }
}
// MARK: - TransactionsTableViewManagerScrollDelegate
extension AccountDetailScreenViewController: TransactionsTableViewManagerScrollDelegate {
    func transactionsTableScrollView(_ transactionsTableScrollView: UIScrollView, didScrollTo offsetY: CGFloat) {
        handleVerticalScroll(offsetY: offsetY)
    }
}
// MARK: - AccountNumberShareViewDelegate
extension AccountDetailScreenViewController: AccountNumberShareViewDelegate {
    func accountNumberTapped() {
        print("AccountNumberTapped")
    }
}
// MARK: - SegmentedSelectionScrollDelegate
extension AccountDetailScreenViewController: SegmentedSelectionScrollDelegate {
    func scrollViewDidScroll(percentage: Double) {
        accountDetailScreenView.segmentedControl.changeSelectionBarPosition(offsetPercentage: percentage)
    }

    func scrollViewDidChangePage(pageNumber: Int) {
        accountDetailScreenView.segmentedControl.selectedSegmentIndex = pageNumber
    }
}

// MARK: - SegmentedControlDelegate
extension AccountDetailScreenViewController: SegmentedControlDelegate {
    func segmentedControlDidChangeValue(_ segmentedControl: SegmentedControl) {
        let index = segmentedControl.selectedSegmentIndex
        accountDetailScreenView.lastPageNumber = index
        accountDetailScreenView.scrollView.scrollToPage(pageNumber: index)
    }
}
// MARK: - Private methods
extension AccountDetailScreenViewController {

    private func heightNeedsToChange(
        constraint: NSLayoutConstraint,
        maxHeight: CGFloat,
        offsetY: CGFloat
    ) -> Bool {

        if constraint.constant > maxHeight && offsetY < 0 {
            return false
        }
        return true
    }

    private func triggerSearchLayout() {
        isSearching = true
        self.scrollToTransactionsView()
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
            self.accountDetailScreenView.searchBarHeight?.constant = 40
            self.accountDetailScreenView.imageHeight?.constant = 0
            self.accountDetailScreenView.searchBar.showsCancelButton = true
            self.accountDetailScreenView.accountDetailView.alpha = 0
            self.accountDetailScreenView.segmentedControlHeight?.constant = 0
            self.setRightButtonItems(includingSearchButton: false)
            self.accountDetailScreenView.scrollView.isScrollEnabled = false
            self.view.layoutIfNeeded()
        }
    }

    private func scrollToTransactionsView() {
        guard
            let item = accountDetailScreenView.segmentedControl.selectedItem(),
                item != .transactionsTab,
            let transactionsIndex = accountDetailScreenView.segmentedControl.indexForItem(item: .transactionsTab)
        else {
            return
        }
        accountDetailScreenView.segmentedControl.selectedSegmentIndex = transactionsIndex
        accountDetailScreenView.lastPageNumber = transactionsIndex
        accountDetailScreenView.scrollView.scrollToPage(pageNumber: transactionsIndex)
    }

    private func triggerDefaultLayout() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
            self.accountDetailScreenView.imageHeight?.constant = 140
            self.accountDetailScreenView.segmentedControlHeight?.constant = 40
            self.accountDetailScreenView.searchBar.showsCancelButton = false
            self.accountDetailScreenView.searchBarHeight?.constant = 0
            self.accountDetailScreenView.accountDetailView.alpha = 1
            self.setRightButtonItems(includingSearchButton: true)
            self.accountDetailScreenView.scrollView.isScrollEnabled = true
            self.view.layoutIfNeeded()
        }
    }

    private func handleVerticalScroll(offsetY: CGFloat) {
        guard let heightConstraint = accountDetailScreenView.imageHeight else { return }
        guard let searchBarHeight = accountDetailScreenView.searchBarHeight else { return }
        if !isSearching {
            if offsetY > 0 {
                let maxImageHeightReduction = min(heightConstraint.constant, offsetY * 0.1)
                let maxSearchBarHeightReduction = min(searchBarHeight.constant, offsetY)
                searchBarHeight.constant -= maxSearchBarHeightReduction
                if searchBarHeight.constant <= 1.1 {
                    heightConstraint.constant -= maxImageHeightReduction
                }
            }

            UIView.animate(withDuration: 0.05) {
                if offsetY < 0 {
                    if self.heightNeedsToChange(constraint: heightConstraint, maxHeight: 155, offsetY: offsetY) {
                        heightConstraint.constant -= offsetY
                    } else if self.heightNeedsToChange(constraint: searchBarHeight, maxHeight: 40, offsetY: offsetY) {
                        searchBarHeight.constant -= offsetY
                    }
                    self.view.layoutIfNeeded()
                }
            }
        }
    }

    private func setRightButtonItems(includingSearchButton: Bool) {
        let menuImage = UIImage(sfSymbol: SFSymbol.menu)
        let searchImage = UIImage(sfSymbol: SFSymbol.search)
        var result: [UIBarButtonItem]

        let menuButton = UIBarButtonItem(
            image: menuImage,
            style: .plain,
            target: self,
            action: #selector(menuButtonPressed)
        )

        if includingSearchButton {
            let searchButton = UIBarButtonItem(
                image: searchImage,
                style: .plain,
                target: self,
                action: #selector(searchButtonPressed)
            )
            result = [menuButton, searchButton]
        } else {
            result = [menuButton]
        }

        navigationItem.rightBarButtonItems = result
    }

    @objc
    private func searchButtonPressed() {
        triggerSearchLayout()
    }

    @objc
    private func menuButtonPressed() {
        print("Menu button tapped")
    }
}

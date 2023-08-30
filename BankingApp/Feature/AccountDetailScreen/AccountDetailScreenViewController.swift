import UIKit

final class AccountDetailScreenViewController: UIViewController {

    private let accountDetailScreenView = AccountDetailScreenView()

    var presenter: AccountDetailScreenViewOutput?

    override func loadView() {
        view = accountDetailScreenView
        navigationController?.navigationBar.layer.zPosition = 1000
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setAccountsViewDelegate() {
        accountDetailScreenView.accountDetailView.setDelegate(delegate: self)
        accountDetailScreenView.segmentedControl.delegate = self
        accountDetailScreenView.segmentedSelectionScrollDelegate = self
    }

    func setTableViewManager(_ tableViewManager: ManagesTransactionsTableView) {
        tableViewManager.setScrollDelegate(self)
        accountDetailScreenView.tableView.delegate = tableViewManager
        tableViewManager.setTableView(accountDetailScreenView.tableView)
        accountDetailScreenView.tableView.dataSource = tableViewManager.dataSource
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
        accountDetailScreenView.accountImageView.image = UIImage(data: model.image)
    }

    func configureViews() {
        setTitleAppearance()
        setRightButtonItems()
    }
}

// MARK: - TransactionsTableViewManagerScrollDelegate
extension AccountDetailScreenViewController: TransactionsTableViewManagerScrollDelegate {
    func transactionsTableScrollView(_ transactionsTableScrollView: UIScrollView, didScrollTo offsetY: CGFloat) {
        guard let heightConstraint = accountDetailScreenView.imageHeight else { return }
        guard let searchBarHeight = accountDetailScreenView.searchBarHeight else { return }
// if making image smaller
        if offsetY > 0 {
            let maxImageHeightReduction = min(heightConstraint.constant, offsetY)
            let maxSearchBarHeightReduction = min(searchBarHeight.constant, offsetY)

            print(maxImageHeightReduction)
            searchBarHeight.constant -= maxSearchBarHeightReduction / 2
            print(searchBarHeight.constant)
            if searchBarHeight.constant <= 5 {
                heightConstraint.constant -= maxImageHeightReduction / 2
            }
        }
// if making image bigger
        print(offsetY)
        if offsetY < 0 {
            if heightNeedsToChange(constraint: heightConstraint, maxHeight: 155, offsetY: offsetY) {
                self.accountDetailScreenView.accountImageView.layer.position.y -= offsetY
                heightConstraint.constant -= offsetY
            } else if heightNeedsToChange(constraint: searchBarHeight, maxHeight: 40, offsetY: offsetY) {
                searchBarHeight.constant -= offsetY
            }
        }
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

    private func setTitleAppearance() {
        let navigaitonBarAppearence = UINavigationBarAppearance()
        navigaitonBarAppearence.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Asset.Colors.viewTitle.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
        navigationController?.navigationBar.standardAppearance = navigaitonBarAppearence
    }

    private func setRightButtonItems() {
        let menuImage = UIImage(sfSymbol: SFSymbol.menu)
        let searchImage = UIImage(sfSymbol: SFSymbol.search)

        let menuButton = UIBarButtonItem(
            image: menuImage,
            style: .plain,
            target: self,
            action: #selector(menuButtonPressed)
        )
        let searchButton = UIBarButtonItem(
            image: searchImage,
            style: .plain,
            target: self,
            action: #selector(searchButtonPressed)
        )

        navigationItem.rightBarButtonItems = [menuButton, searchButton]
    }

    @objc
    private func searchButtonPressed() {
        print("Search button tapped")
    }

    @objc
    private func menuButtonPressed() {
        print("Menu button tapped")
    }
}

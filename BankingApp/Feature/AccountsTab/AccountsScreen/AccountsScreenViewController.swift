import UIKit

final class AccountsScreenViewController: UIViewController {

    private let accountsScreenView = AccountsScreenView()
    private let overlayView = OverlayView(title: L10n.OverlayScreen.appName, subtitle: L10n.OverlayScreen.connecting)

    var presenter: AccountsScreenViewOutput?

    override func loadView() {
        view = accountsScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        presenter?.viewDidLoad(self)
        OverlayManager.shared.presentOverlayView(overlayView)
    }

    func setTableViewManager(_ manager: ManagesAccountsScreenTable) {
        manager.tableView = accountsScreenView.tableView
        accountsScreenView.tableView.dataSource = manager
        accountsScreenView.tableView.delegate = manager
    }
}

// MARK: - AccountsScreenViewInput
extension AccountsScreenViewController: AccountsScreenViewInput {
    func displayAccounts() {
        OverlayManager.shared.removeOverlayView()
    }

    func setAccounts() {
        accountsScreenView.tableView.reloadData()
    }

    func displayFailedToFetchUsersAlert() {
        displayFailedToRetrieveDataAlert()
    }

    func setAccountDisplayStyle(_ selectedStyle: AccountDisplayStyle) {
        // wrapping in animate block to increase speed of fade animation
        UIView.animate(withDuration: 0.2) {
            self.accountsScreenView.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        setAccountDisplayIcon(newStyle: selectedStyle)
    }

    func configureViews() {
        configureNavigationBar()
        presenter?.viewDidRequestAccountDisplayStyle(self)
    }
}

// MARK: - Private methods
extension AccountsScreenViewController {
    private func configureNavigationBar() {
        setNavigationBarTitle()
        setLeftNavigationItem()
    }

    private func setNavigationBarTitle() {
        title = L10n.AccountsScreen.title
    }

    private func setLeftNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(sfSymbol: SFSymbol.rectangleOnRectangle),
            style: .plain,
            target: self,
            action: #selector (didTapAccountsBarButton)
        )
    }

    private func setAccountDisplayIcon(newStyle: AccountDisplayStyle) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 15, weight: .light, scale: .large)
        switch newStyle {
        case .list:
            navigationItem.leftBarButtonItem?.image = UIImage(
                sfSymbol: SFSymbol.list,
                withConfiguration: configuration
            )
        case .image:
            navigationItem.leftBarButtonItem?.image = UIImage(
                sfSymbol: SFSymbol.rectangleOnRectangle,
                withConfiguration: configuration
            )
        }
    }

    @objc
    private func didTapAccountsBarButton() {
        presenter?.viewDidTapDisplayStyleButton(self)
    }

    private func displayFailedToRetrieveDataAlert() {
        let alertController = UIAlertController(
            title: L10n.AccountsScreen.somethigWentWrong,
            message: L10n.AccountsScreen.failedToRetrieveData,
            preferredStyle: .alert
        )

        let retryAction = UIAlertAction(
            title: L10n.AccountsScreen.retry,
            style: .default) { [weak self] _ in
                guard let self else { return }
                self.presenter?.viewDidRequestAccountsInformation(self)
            }

        let cancelAction = UIAlertAction(
            title: L10n.AccountsScreen.cancel,
            style: .cancel
        )

        alertController.addAction(retryAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

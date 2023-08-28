import UIKit

final class AccountDetailScreenViewController: UIViewController {

    private let accountDetailScreenView = AccountDetailScreenView()

    var presenter: AccountDetailScreenViewOutput?

    override func loadView() {
        view = accountDetailScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setAccountsViewDelegate() {
        accountDetailScreenView.accountDetailView.setDelegate(delegate: self)
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
            availible: model.availible,
            imageData: model.image
        )
    }

    func configureViews() {
        setTitleAppearance()
    }
}

// MARK: - AccountNumberShareViewDelegate
extension AccountDetailScreenViewController: AccountNumberShareViewDelegate {
    func accountNumberTapped() {
        print("AccountNumberTapped")
    }
}
// MARK: - Private methods
extension AccountDetailScreenViewController {
    private func setTitleAppearance() {
        let navigaitonBarAppearence = UINavigationBarAppearance()
        navigaitonBarAppearence.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Asset.Colors.viewTitle.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
        navigationController?.navigationBar.standardAppearance = navigaitonBarAppearence
    }
}

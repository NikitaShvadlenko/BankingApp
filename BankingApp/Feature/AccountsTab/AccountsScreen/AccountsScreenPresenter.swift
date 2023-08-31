import Foundation

final class AccountsScreenPresenter {
    weak var view: AccountsScreenViewInput?
    weak var moduleOutput: AccountsScreenModuleOutput?
    var interactor: AccountsScreenInteractorInput?
    var router: AccountsScreenRouterInput?
    var accountsManager: ManagesAccountsScreenTable?

    private var loadImageCompletions: [URL: (Data) -> Void] = [:]
}

// MARK: - AccountsScreenViewOutput
extension AccountsScreenPresenter: AccountsScreenViewOutput {
    func viewDidRequestAccountsInformation(_ view: AccountsScreenViewInput) {
        interactor?.fetchAccounts(for: "Jake Smith")
    }

    func viewDidRequestAccountDisplayStyle(_ view: AccountsScreenViewInput) {
        interactor?.retrieveAccountDisplayStyle()
    }

    func viewDidTapDisplayStyleButton(_ view: AccountsScreenViewInput) {
        interactor?.setNextDisplayStyle()
    }

    func viewDidTapLogoutButton(_ view: AccountsScreenViewInput) {
        print("Asking interactor to logout")
    }

    func viewDidLoad(_ view: AccountsScreenViewInput) {
        view.configureViews()
        interactor?.fetchAccounts(for: "Jake Smith")
    }
}

// MARK: - AccountsScreenInteractorOutput
extension AccountsScreenPresenter: AccountsScreenInteractorOutput {
    func interactor(
        _ interactor: AccountsScreenInteractorInput,
        didFetchImageData data: Data,
        forURL url: URL
    ) {
        let completion = loadImageCompletions[url]
        loadImageCompletions.removeValue(forKey: url)
        completion?(data)
        if loadImageCompletions.isEmpty {
            view?.displayAccounts()
        }
    }

    func interactorDidRetrieveAccountDetails(
        _ interactor: AccountsScreenInteractorInput,
        result: Result<[Account], Error>
    ) {
        switch result {
        case .success(let accounts):
            accountsManager?.setAccounts(accounts)
            view?.setAccounts()
        case .failure(let error):
            view?.displayFailedToFetchUsersAlert()
            print(error)
        }
    }

    func interactorDidRetrieveAccountDisplayStyle(
        _ interactor: AccountsScreenInteractorInput,
        result: Result<AccountDisplayStyle, UserSettingManagerError>
    ) {
        switch result {
        case .success(let style):
            accountsManager?.setAccountDisplayStyle(style)
            view?.setAccountDisplayStyle(style)
        case .failure(let error):
            switch error {
            case .failedToRetrieveItem:
                accountsManager?.setAccountDisplayStyle(AccountDisplayStyle.list)
                view?.setAccountDisplayStyle(AccountDisplayStyle.list)
            case .noAccountStyles:
                fatalError("No account styles")
            }
        }
    }
}
// MARK: - AccountsScreenTableManagerDelegate
extension AccountsScreenPresenter: AccountsScreenTableManagerDelegate {
    func accountsScreenTableManager(
        _ accountsScreenTableManager: ManagesAccountsScreenTable,
        didSelectItemAt indexPath: IndexPath
    ) {
        let account = accountsScreenTableManager.accounts[indexPath.row]
        let imageData = accountsScreenTableManager.imageForIndexPath(indexPath)
        router?.routeToAccontDetailScreen(for: account, imageData: imageData)
    }

    func accountsScreenTableManager(
        _ accountsScreenTableManager: ManagesAccountsScreenTable,
        needsImageFor indexPath: IndexPath,
        completion: @escaping (Data) -> Void) {
            let url = accountsScreenTableManager.accounts[indexPath.row].image
            loadImageCompletions[url] = completion
            interactor?.fetchImage(url: url)
        }
}
// MARK: - AccountsScreenRouterOutput
extension AccountsScreenPresenter: AccountsScreenRouterOutput {
}

// MARK: - AccountsScreenModuleInput
extension AccountsScreenPresenter: AccountsScreenModuleInput {
    func configureModule(output: AccountsScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

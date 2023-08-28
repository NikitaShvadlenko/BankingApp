import Foundation

final class AccountDetailScreenPresenter {
    weak var view: AccountDetailScreenViewInput?
    weak var moduleOutput: AccountDetailScreenModuleOutput?
    var interactor: AccountDetailScreenInteractorInput?
    var router: AccountDetailScreenRouterInput?
    var account: Account?
    var accountImage: Data?
}

// MARK: - AccountDetailScreenViewOutput
extension AccountDetailScreenPresenter: AccountDetailScreenViewOutput {
    func viewDidLoad(_ view: AccountDetailScreenViewInput) {
        view.configureViews()
        setAccount()
    }
}

// MARK: - AccountDetailScreenInteractorOutput
extension AccountDetailScreenPresenter: AccountDetailScreenInteractorOutput {
}

// MARK: - AccountDetailScreenRouterOutput
extension AccountDetailScreenPresenter: AccountDetailScreenRouterOutput {
}

// MARK: - AccountDetailScreenModuleInput
extension AccountDetailScreenPresenter: AccountDetailScreenModuleInput {
    func configureModule(output: AccountDetailScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension AccountDetailScreenPresenter {
    private func accountViewModel(from account: Account, image: Data) -> AccountViewModel {
        return AccountViewModel(
            image: image,
            amount: account.amount,
            availible: account.availible,
            accountNumber: account.number
        )
    }

    private func setAccount() {
        guard let account,
              let accountImage
        else { return }
        let viewModel = accountViewModel(from: account, image: accountImage)
        view?.setAccountView(with: viewModel)
    }
}

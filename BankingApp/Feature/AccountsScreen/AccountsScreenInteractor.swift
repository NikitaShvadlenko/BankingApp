import Foundation

final class AccountsScreenInteractor {
    weak var presenter: AccountsScreenInteractorOutput?
    var userSettingsManager: ManagesUserSettings?
    var accountProvider: ProvidesAccounts?
}

// MARK: - AccountsScreenInteractorInput
extension AccountsScreenInteractor: AccountsScreenInteractorInput {
    func fetchAccounts(for accountName: String) {
        accountProvider?.fetchUserDetails(for: accountName) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let userData):
                self.presenter?.interactorDidRetrieveAccountDetails(self, result: .success(userData))
            case .failure(let error):
                self.presenter?.interactorDidRetrieveAccountDetails(self, result: .failure(error))
            }
        }
    }

    func setNextDisplayStyle() {
        guard let storage = userSettingsManager else { return }
        do {
            let style = try storage.nextAccountDisplayStyle()
            presenter?.interactorDidRetrieveAccountDisplayStyle(self, result: .success(style))
        } catch {
            guard let error = error as? UserSettingManagerError else {
                fatalError("Unknown error")
            }
            presenter?.interactorDidRetrieveAccountDisplayStyle(self, result: .failure(error))
        }

    }

    func retrieveAccountDisplayStyle() {
        guard let storage = userSettingsManager else { return }
        do {
            let style = try storage.retrieveAccountDisplayStyle()
            presenter?.interactorDidRetrieveAccountDisplayStyle(self, result: .success(style))
        } catch {
            guard let error = error as? UserSettingManagerError else {
                fatalError("Unknown error")
            }
            presenter?.interactorDidRetrieveAccountDisplayStyle(self, result: .failure(error))
        }
    }

}

// MARK: - Private methods
extension AccountsScreenInteractor {
}

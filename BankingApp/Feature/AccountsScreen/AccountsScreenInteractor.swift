import Foundation

final class AccountsScreenInteractor {
    weak var presenter: AccountsScreenInteractorOutput?
    var userSettingsManager: ManagesUserSettings?
}

// MARK: - AccountsScreenInteractorInput
extension AccountsScreenInteractor: AccountsScreenInteractorInput {
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

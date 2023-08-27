import Foundation

final class AccountsScreenInteractor {
    weak var presenter: AccountsScreenInteractorOutput?
    var userSettingsManager: ManagesUserSettings?
    var accountProvider: ProvidesAccounts?
    var imageDownloader: ImageDownloaderProtocol?
    var placeholderStore: StoresPlaceholders?
    private let imageCache = NSCache<NSURL, NSData>()
}

// MARK: - AccountsScreenInteractorInput
extension AccountsScreenInteractor: AccountsScreenInteractorInput {
    func fetchImage(url: URL) {
        if let data = imageCache.object(forKey: url as NSURL) as Data? {
            presenter?.interactor(self, didFetchImageData: data, forURL: url)
        }

        guard
            let imageDownloader = imageDownloader,
            let placeholderStore = placeholderStore
        else { return }
        Task {
            do {
                let result = try await imageDownloader.fetchImage(from: url)
                Task { @MainActor in
                    self.imageCache.setObject(result as NSData, forKey: url as NSURL)
                    presenter?.interactor(self, didFetchImageData: result, forURL: url)
                }
            } catch {
               let imageData = placeholderStore.placeholderImageData()
                presenter?.interactor(self, didFetchImageData: imageData, forURL: url)
            }
        }
    }

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

import Foundation

final class TransferScreenPresenter {
    weak var view: TransferScreenViewInput?
    weak var moduleOutput: TransferScreenModuleOutput?
    var interactor: TransferScreenInteractorInput?
    var router: TransferScreenRouterInput?
}

// MARK: - TransferScreenViewOutput
extension TransferScreenPresenter: TransferScreenViewOutput {
    func viewDidLoad(_ view: TransferScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - TransferScreenInteractorOutput
extension TransferScreenPresenter: TransferScreenInteractorOutput {
}

// MARK: - TransferScreenRouterOutput
extension TransferScreenPresenter: TransferScreenRouterOutput {
}

// MARK: - TransferScreenModuleInput
extension TransferScreenPresenter: TransferScreenModuleInput {
    func configureModule(output: TransferScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension TransferScreenPresenter {
}

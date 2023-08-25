import Foundation

final class PaymentsScreenPresenter {
    weak var view: PaymentsScreenViewInput?
    weak var moduleOutput: PaymentsScreenModuleOutput?
    var interactor: PaymentsScreenInteractorInput?
    var router: PaymentsScreenRouterInput?
}

// MARK: - PaymentsScreenViewOutput
extension PaymentsScreenPresenter: PaymentsScreenViewOutput {
    func viewDidLoad(_ view: PaymentsScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - PaymentsScreenInteractorOutput
extension PaymentsScreenPresenter: PaymentsScreenInteractorOutput {
}

// MARK: - PaymentsScreenRouterOutput
extension PaymentsScreenPresenter: PaymentsScreenRouterOutput {
}

// MARK: - PaymentsScreenModuleInput
extension PaymentsScreenPresenter: PaymentsScreenModuleInput {
    func configureModule(output: PaymentsScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension PaymentsScreenPresenter {
}

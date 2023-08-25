import Foundation

final class ServicesScreenPresenter {
    weak var view: ServicesScreenViewInput?
    weak var moduleOutput: ServicesScreenModuleOutput?
    var interactor: ServicesScreenInteractorInput?
    var router: ServicesScreenRouterInput?
}

// MARK: - ServicesScreenViewOutput
extension ServicesScreenPresenter: ServicesScreenViewOutput {
    func viewDidLoad(_ view: ServicesScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - ServicesScreenInteractorOutput
extension ServicesScreenPresenter: ServicesScreenInteractorOutput {
}

// MARK: - ServicesScreenRouterOutput
extension ServicesScreenPresenter: ServicesScreenRouterOutput {
}

// MARK: - ServicesScreenModuleInput
extension ServicesScreenPresenter: ServicesScreenModuleInput {
    func configureModule(output: ServicesScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension ServicesScreenPresenter {
}

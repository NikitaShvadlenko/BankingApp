// sourcery: AutoMockable
import Foundation
protocol AccountDetailScreenViewInput: AnyObject {
    func configureViews()
    func setAccountView(with model: AccountViewModel)
    func setNavigationBarTitle(newTitle: String)
}

protocol AccountDetailScreenViewOutput {
    func viewDidLoad(_ view: AccountDetailScreenViewInput)
}

// sourcery: AutoMockable
protocol AccountDetailScreenInteractorInput {
}

// sourcery: AutoMockable
protocol AccountDetailScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol AccountDetailScreenRouterInput {
}

protocol AccountDetailScreenRouterOutput: AnyObject {
}

protocol AccountDetailScreenModuleInput: AnyObject {
	func configureModule(output: AccountDetailScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol AccountDetailScreenModuleOutput: AnyObject {
}

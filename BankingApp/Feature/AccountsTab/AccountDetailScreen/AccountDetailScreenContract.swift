// sourcery: AutoMockable
import Foundation
protocol AccountDetailScreenViewInput: AnyObject {
    func configureViews()
    func setAccountView(with model: AccountViewModel)
    func setNavigationBarTitle(newTitle: String)
}

protocol AccountDetailScreenViewOutput {
    func viewDidLoad(_ view: AccountDetailScreenViewInput)
    func viewDidSearch(_ view: AccountDetailScreenViewInput, text: String)
    func viewDidPressShareAccount(_ view: AccountDetailScreenViewInput)
}

// sourcery: AutoMockable
protocol AccountDetailScreenInteractorInput {
}

// sourcery: AutoMockable
protocol AccountDetailScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol AccountDetailScreenRouterInput {
    func routeToTransactionsScreen(transactions: [Transaction], index: Int)
    func presentShareScreen(shareString: String)
}

protocol AccountDetailScreenRouterOutput: AnyObject {
}

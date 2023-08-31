import UIKit

final class TransactionDetailScreenViewController: UIViewController {

    private let transactionDetailScreenView = TransactionDetailScreenView()

    var presenter: TransactionDetailScreenViewOutput?

    override func loadView() {
        view = transactionDetailScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - TransactionDetailScreenViewInput
extension TransactionDetailScreenViewController: TransactionDetailScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension TransactionDetailScreenViewController {
}

import UIKit

final class TransferScreenViewController: UIViewController {

    private let transferScreenView = TransferScreenView()

    var presenter: TransferScreenViewOutput?

    override func loadView() {
        view = transferScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - TransferScreenViewInput
extension TransferScreenViewController: TransferScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension TransferScreenViewController {
}

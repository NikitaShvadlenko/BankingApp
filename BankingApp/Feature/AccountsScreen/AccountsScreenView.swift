import UIKit
import SnapKit

final class AccountsScreenView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AccountOverviewCell.self, forCellReuseIdentifier: "\(AccountOverviewCell.self)")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension AccountsScreenView {
    private func configureViews() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

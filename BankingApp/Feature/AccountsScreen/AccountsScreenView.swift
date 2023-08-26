import UIKit
import SnapKit

final class AccountsScreenView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 120
        tableView.register(AccountOverviewImageCell.self, forCellReuseIdentifier: "\(AccountOverviewImageCell.self)")
        tableView.register(AccountOverviewTextCell.self, forCellReuseIdentifier: "\(AccountOverviewTextCell.self)")
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

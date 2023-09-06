//
//  SelectAccountTableViewManager.swift
//  BankingApp
//
//  Created by Nikita Shvad on 06.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

protocol ManagesTableView: UITableViewDataSource, UITableViewDelegate {
    var accounts: [ApplicationAccountDescription] { get }
    func setAccounts(_ accounts: [ApplicationAccountDescription])
}

final class SelectAccountTableViewManager: NSObject {
    var accounts: [ApplicationAccountDescription] = []
}

extension SelectAccountTableViewManager: ManagesTableView {
    func setAccounts(_ accounts: [ApplicationAccountDescription]) {
        self.accounts = accounts
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

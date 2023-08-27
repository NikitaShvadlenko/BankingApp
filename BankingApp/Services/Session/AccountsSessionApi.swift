//
//  AccountsSessionApi.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

final class AccountsSessionApi {
    let session: SessionProtocol

    init(session: SessionProtocol) {
        self.session = session
    }
}

extension AccountsSessionApi: ImageDownloaderProtocol {

    func fetchImage(from url: URL) async throws -> Data {
        try await session.makeDataRequest(AccountsRequest.accountImage(url: url))
    }
}

//
//  ImageDownloaderProtocol.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

protocol ImageDownloaderProtocol {
    func fetchImage(from url: URL) async throws -> Data
}

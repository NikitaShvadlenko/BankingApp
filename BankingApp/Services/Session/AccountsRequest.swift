//
//  ImageRequest.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation
enum AccountsRequest {
    case accountImage(url: URL)
}

extension AccountsRequest: Request {
    var baseUrl: URL {
        switch self {
        case .accountImage(let url):
            return url
        }
    }

    var path: String {
        switch self {
        case .accountImage:
            return ""
        }
    }

    var method: HTTPMethod {
        switch self {
        case .accountImage:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .accountImage:
            return nil
        }
    }

    var mapper: any Mapper {
        switch self {
        case .accountImage:
            return DataMapper()
        }
    }

}

//
//  Session.swift
//  RickAndMortyTestTask
//
//  Created by Nikita Shvad on 23.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation

public final class Session {
    public enum SessionError: Error {
        case invalidResponse
        case failedToMap
        case invalidMappingType
    }

    private let session: URLSession

    public init(
        urlSession: URLSession = .shared
    ) {
        self.session = urlSession
    }
}

extension Session: SessionProtocol {
    func makeDataRequest<T: Decodable>(_ request: Request) async throws -> T {
        var url = request.baseUrl

        if !request.path.isEmpty {
            url = url.appendingPathComponent(request.path)
        }

        if let queryItems = request.queryItems {
            url = url.appending(queryItems: queryItems)
        }

        let (data, response) = try await session.data(from: url)
        guard let httpResonse = response as? HTTPURLResponse,
              httpResonse.statusCode == 200 else {
            throw SessionError.invalidResponse
        }
        let mapper = request.mapper
        guard let mappedResponse = try mapper.map(from: data) as? T else {
            throw SessionError.invalidMappingType
        }
        return mappedResponse
    }
}

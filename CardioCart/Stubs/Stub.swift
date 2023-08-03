//
//  Stub.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

internal enum StubError: Error {
    case stubNotFound(String)
}

internal enum Stub: String {
    case user
    case userProgress

    private var filename: String {
        switch self {
        case .user:
            return "user"
        case .userProgress:
            return "userProgress"
        }
    }

    func load<T: Decodable>() throws -> T {
        let bundle = Bundle(for: AppDelegate.self)
        guard let url = bundle.url(
                forResource: filename,
                withExtension: "json")
        else {
            throw StubError.stubNotFound(filename)
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

}

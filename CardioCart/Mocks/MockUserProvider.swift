//
//  MockUserProvider.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

internal final class MockUserProvider: UserProvider {

    private lazy var testUser: User? = {
        do {
            let user: User = try Stub.user.load()
            return user
        } catch let error as StubError {
            print("StubError: \(error)")
            return nil
        } catch let error {
            print("Test user load error: \(error)")
            return nil
        }
    }()

    var isLoggedIn: Bool { currentUser != nil }

    var currentUser: User? {
        testUser
    }
}

//
//  MockUserProvider.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

private var testUser = User(id: UUID(), name: "Bobby")

internal struct MockUserProvider: UserProvider {
    var isLoggedIn: Bool { false }

    var currentUser: User? {
        testUser
    }
}

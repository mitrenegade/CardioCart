//
//  LeaderBoardCoordinator.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

internal struct LeaderBoardViewModel {
    private var coordinator: LeaderBoardCoordinator?

    private let userProvider = MockUserProvider()

    init(coordinator: LeaderBoardCoordinator) {
        self.coordinator = coordinator
    }

    func currentLeaders() -> [User] {
        if let user = userProvider.currentUser {
            return [user]
        } else {
            return []
        }
    }
}

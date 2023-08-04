//
//  LeaderBoardCoordinator.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

internal struct LeaderBoardViewModel {

    // MARK: - Types

    enum LeaderBoardError: Error {
        case invalidIndex
    }

    // MARK: - Properties

    private var coordinator: LeaderBoardCoordinator?

    private let userProvider: UserProviderProtocol

    private let userProgressProvider: UserProgressProviderProtocol

    private let users: [User]

    init(coordinator: LeaderBoardCoordinator,
         userProvider: UserProviderProtocol = MockUserProvider(),
         userProgressProvider: UserProgressProviderProtocol = MockUserProgressProvider()) {
        self.coordinator = coordinator
        if let user = userProvider.currentUser {
            users = [user]
        } else {
            users = []
        }

        self.userProvider = userProvider
        self.userProgressProvider = userProgressProvider
    }

    var count: Int {
        users.count
    }

    func title(at index: Int) throws -> String {
        guard index < users.count else {
            throw LeaderBoardError.invalidIndex
        }
        return users[index].name
    }

    func steps(at index: Int) throws -> Int {
        guard index < users.count else {
            throw LeaderBoardError.invalidIndex
        }
        let user = users[index]
        let progress = userProgressProvider.userProgress(for: user)
        return progress?.progress.steps ?? 0
    }

    func place(at index: Int) throws -> Int {
        guard index < users.count else {
            throw LeaderBoardError.invalidIndex
        }
        return 1
    }
}

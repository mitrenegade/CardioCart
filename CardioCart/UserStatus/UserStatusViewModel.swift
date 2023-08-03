//
//  UserStatusViewModel.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import UIKit

internal struct UserStatusViewModel {

    // MARK: - Properties

    let user: User

    private weak var coordinator: MainCoordinator?

    private let progressProvider = MockUserProgressProvider()

    // MARK: - Calculated Properties
    var userName: String {
        user.name
    }

    var steps: Int {
        progressProvider.userProgress(for: user)?.progress.steps ?? 0
    }

    // MARK: - Init

    init(user: User, coordinator: MainCoordinator?) {
        self.user = user
        self.coordinator = coordinator
    }

    // MARK: - Public functions

    func viewLeaderBoard() {
        self.coordinator?.showLeaderBoard()
    }
}

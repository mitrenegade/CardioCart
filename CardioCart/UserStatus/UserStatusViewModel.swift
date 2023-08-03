//
//  UserStatusViewModel.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import UIKit

internal struct UserStatusViewModel {

    let user: User

    private let progressProvider = MockUserProgressProvider()

    var userName: String {
        user.name
    }

    var steps: Int {
        progressProvider.userProgress(for: user)?.progress.steps ?? 0
    }
}

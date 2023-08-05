//
//  MainCoordinator.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation
import UIKit

internal final class MainCoordinator: Coordinator {

    // MARK: - Properties

    let navigationController: UINavigationController

    private let userProvider: UserProviderProtocol

    private var childCoordinators = [Coordinator]()

    // MARK: - Init

    init(userProvider: UserProviderProtocol, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.userProvider = userProvider
    }

    func start() {
        if let user = userProvider.currentUser {
            showHomeView(user: user)
        } else {
            showLoginSignup()
        }
    }

    // MARK: - Public functions

    func showHomeView(user: User) {
        let viewController: UIViewController
        let viewModel = UserStatusViewModel(user: user, coordinator: self)
        viewController = UserStatusViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }

    func showLeaderBoard() {
        let coordinator = LeaderBoardCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func showLoginSignup() {
        let coordinator = LoginSignupCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

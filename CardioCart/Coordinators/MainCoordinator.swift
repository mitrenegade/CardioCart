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
        let viewController: UIViewController
        if let user = userProvider.currentUser {
            let viewModel = UserStatusViewModel(user: user, coordinator: self)
            viewController = UserStatusViewController(viewModel: viewModel)
        } else {
            viewController = LoginViewController()
        }

        navigationController.pushViewController(viewController, animated: false)
    }

    // MARK: - Public functions

    func showLeaderBoard() {
        let coordinator = LeaderBoardCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

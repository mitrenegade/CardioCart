//
//  LeaderBoardCoordinator.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/3/23.
//

import UIKit

internal final class LeaderBoardCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = LeaderBoardViewModel(coordinator: self)
        let viewController = LeaderBoardViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
}

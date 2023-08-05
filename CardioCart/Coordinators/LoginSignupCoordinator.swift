//
//  LoginSignupCoordinator.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/4/23.
//

import Foundation
import UIKit

internal final class LoginSignupCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = LoginSignupViewModel(coordinator: self)
        let viewController = LoginSignupViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
}

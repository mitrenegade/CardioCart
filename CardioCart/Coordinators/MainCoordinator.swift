//
//  MainCoordinator.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation
import UIKit

internal struct MainCoordinator: Coordinator {

    let navigationController: UINavigationController

    private let userProvider: UserProvider

    init(userProvider: UserProvider, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.userProvider = userProvider
    }

    func start() {
        let vc: UIViewController
        if userProvider.isLoggedIn {
            vc = LeaderBoardViewController()
        } else {
            vc = LoginViewController()
        }

        navigationController.pushViewController(vc, animated: false)
    }

}

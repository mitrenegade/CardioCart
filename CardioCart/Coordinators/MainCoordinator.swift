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

    func start() {
        let vc = ViewController()
        navigationController.pushViewController(vc, animated: false)
    }

}

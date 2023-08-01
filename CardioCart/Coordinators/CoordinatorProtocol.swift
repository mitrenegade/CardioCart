//
//  CoordinatorProtocol.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }

    func start()
}

//
//  LoginSignupViewController.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/4/23.
//

import UIKit

class LoginSignupViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: LoginSignupViewModel

    // MARK: - Init

    init(viewModel: LoginSignupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}

//
//  UserStatusViewController.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import UIKit

internal final class UserStatusViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: UserStatusViewModel

    // MARK: - Subviews

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - View Lifecycle

    init(user: User) {
        viewModel = UserStatusViewModel(user: user)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Private

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(label)

        label.frame = view.frame
        label.text = "\(viewModel.userName): \(viewModel.steps)"
    }
}

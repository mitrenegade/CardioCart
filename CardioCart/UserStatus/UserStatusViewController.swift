//
//  UserStatusViewController.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

internal final class UserStatusViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: UserStatusViewModel

    private let disposeBag = DisposeBag()

    // MARK: - Subviews

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(frame: .zero)
        return button
    }()

    // MARK: - View Lifecycle

    init(viewModel: UserStatusViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupBindings()
    }

    // MARK: - Private

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(label)

        label.frame = view.frame
        label.text = "\(viewModel.userName): \(viewModel.steps)"

        view.addSubview(button)
        button.backgroundColor = .brown
        button.setTitle("Leader Board", for: .normal)
    }

    private func setupConstraints() {
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
            $0.centerX.centerY.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
            $0.top.equalTo(label.snp.bottom).offset(8)
            $0.height.equalTo(24)
        }
    }

    private func setupBindings() {
        button.rx.tap.bind { [weak self] _ in
            self?.viewModel.viewLeaderBoard()
        }.disposed(by: disposeBag)
    }
}

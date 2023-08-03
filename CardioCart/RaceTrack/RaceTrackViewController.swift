//
//  RaceTrackViewController.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/2/23.
//

import UIKit

class RaceTrackViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: RaceTrackViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init(viewModel: RaceTrackViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

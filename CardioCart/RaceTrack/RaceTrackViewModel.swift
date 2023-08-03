//
//  RaceTrackViewModel.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/2/23.
//

import UIKit
import RxSwift
import RxCocoa

internal struct RaceTrackViewModel {

    // MARK: - Properties

    private let progressRelay = PublishRelay<UserProgress>()

    lazy var progressObservable: Observable<UserProgress> = {
        progressRelay.asObservable()
    }()

    // MARK: -

    init(progress: UserProgress) {
        progressRelay.accept(progress)
    }
}

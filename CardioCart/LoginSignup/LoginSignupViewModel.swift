//
//  LoginSignupViewModel.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/4/23.
//

import Foundation

internal struct LoginSignupViewModel {
    
    // MARK: - Types
    
    enum LoginSignupError: Error {
        case invalid
    }
    
    // MARK: - Properties
    
    private var coordinator: LoginSignupCoordinator?
    
    init(coordinator: LoginSignupCoordinator) {
        self.coordinator = coordinator
    }
}

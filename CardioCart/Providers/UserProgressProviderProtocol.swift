//
//  UserProgressProviderProtocol.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

protocol UserProgressProviderProtocol {
    func userProgress(for: User) -> UserProgress?
}

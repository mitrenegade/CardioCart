//
//  UserProviderProtocol.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

protocol UserProvider {
    var isLoggedIn: Bool { get }
    var currentUser: User? { get }
}

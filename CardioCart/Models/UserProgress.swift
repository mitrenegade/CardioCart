//
//  UserProgress.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

internal struct UserProgress: Codable {
    var userID: UUID
    var progress: Progress
}

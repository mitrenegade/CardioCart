//
//  MockUserProgressProvider.swift
//  CardioCart
//
//  Created by Bobby Ren on 8/1/23.
//

import Foundation

internal final class MockUserProgressProvider: UserProgressProviderProtocol {
    private lazy var testUserProgress: UserProgress? = {
        do {
            let userProgress: UserProgress = try Stub.userProgress.load()
            return userProgress
        } catch let error as StubError {
            print("StubError: \(error)")
            return nil
        } catch let error {
            print("Test userProgress load error: \(error)")
            return nil
        }
    }()

    func userProgress(for: User) -> UserProgress? {
        testUserProgress
    }
}

//
//  UserRepositoryProtocol.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Foundation

protocol UserRepositoryProtocol {
    func isUserLoggedIn() -> Bool
    func onboardingIsFinished() -> Bool
    func setOnboardingIsFinished()
    func signIn(provider: SignInProvider) async throws -> Bool
    func signOut()
    func deleteAccount()
}

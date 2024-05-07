//
//  File.swift
//  
//
//  Created by Maros Petrus on 03/07/2023.
//

import Foundation

class OnboardingDependencies {

    let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

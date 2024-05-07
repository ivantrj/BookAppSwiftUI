//
//  SignInProviders.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Foundation
import AuthenticationServices

enum SignInProvider {
    case apple(credential: ASAuthorizationCredential)
    case google
}

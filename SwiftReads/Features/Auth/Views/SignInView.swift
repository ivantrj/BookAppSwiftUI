//
//  SignInView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct SignInView: View {

    let viewModel: SignInViewModel

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            LogoView()
            Spacer()
            Text("Sign In")
                .font(.title.medium)
            Text("SwiftReads offers two sign in options that can be extended by other options like email & password, or other social networks")
                .multilineTextAlignment(.center)
                .font(.defaultText.regular)
            SignInWithAppleButton(onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            }, onCompletion: viewModel.onSignInWithAppleButtonCompletion)
            .frame(height: 56)
            SailButton(
                style: .secondary,
                action: {
                    Task {
                        await viewModel.onSignInWithGoogleButtonTap()
                    }
                },
                icon: Asset.Images.google.swiftUIImage.renderingMode(.template),
                title: "Sign In with Google"
            )
            Spacer()
        }
        .padding(16)
        .preferredColorScheme(.dark)
    }
}

//
//  SailButton.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import SwiftUI

public struct SailButton: View {

    public enum SailButtonStyle {
        case primary
        case secondary
        case neutral
        case link
    }

    var style: SailButtonStyle = .primary
    let action: () -> ()
    let icon: Image
    let title: String

    public init(style: SailButtonStyle = .primary, action: @escaping () -> Void, icon: Image, title: String) {
        self.style = style
        self.action = action
        self.icon = icon
        self.title = title
    }

    public var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 8) {
                icon
                Text(title)
                    .font(.defaultText.regular)
            }
            .foregroundStyle(textColor)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .cornerRadius(16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(borderColor, lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 20).fill(color))
                    .shadow(radius: style == .neutral ? 4 : 0)
            )
        })
    }

    var color: Color {
        switch style {
        case .primary: return Asset.Colors.appPrimary.swiftUIColor
        case .secondary: return .clear
        case .neutral: return .white
        case .link: return .clear
        }
    }

    var borderColor: Color {
        switch style {
        case .primary: return .clear
        case .secondary: return Asset.Colors.appPrimary.swiftUIColor
        case .neutral: return .clear
        case .link: return .clear
        }
    }

    var textColor: Color {
        switch style {
        case .primary: return .white
        case .secondary: return Asset.Colors.appPrimary.swiftUIColor
        case .neutral: return .black
        case .link: return Asset.Colors.appPrimary.swiftUIColor
        }
    }
}

#Preview {
    ZStack {
        Color.black
        VStack {
            SailButton(
                style: .primary,
                action: {},
                icon: Image(systemName: "apple.logo"),
                title: "Sign in with Apple"
            )
            SailButton(
                style: .secondary,
                action: {},
                icon: Image(systemName: "checkmark.circle"),
                title: "I agree"
            )
            SailButton(
                style: .neutral,
                action: {},
                icon: Image(systemName: "apple.logo"),
                title: "Sign in with Apple"
            )
            SailButton(
                style: .link,
                action: {},
                icon: Image(systemName: "checkmark.circle"),
                title: "I agree"
            )
        }
    }
}

//
//  Banner.swift
//  SwiftReads
//
//  Created by Maros Petrus on 23/03/2024.
//

import SwiftUI

struct Banner: View {

    enum BannerStyle {
        case info
        case error
        case success
    }

    var style: BannerStyle = .info
    var icon: String?
    let title: String
    var description: String?

    init(
        style: BannerStyle = .info,
        icon: String? = nil,
        title: String,
        description: String? = nil
    ) {
        self.style = style
        self.icon = icon
        self.title = title
        self.description = description
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            if let icon {
                Image(systemName: icon)
                    .foregroundStyle(strokeColor)
            }
            VStack(alignment: .leading) {
                Text(title)
                if let description {
                    Text(description)
                        .font(.footnote)
                }
            }
            .foregroundStyle(textColor)
            Spacer()
        }
        .font(.defaultText.regular)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.clear)
                .stroke(strokeColor, style: .init())
        )
    }

    var strokeColor: Color {
        switch style {
        case .info: return Asset.Colors.appPrimary.swiftUIColor
        case .error: return .red
        case .success: return .green
        }
    }

    var textColor: Color {
        switch style {
        case .info: return .primary
        case .error: return .red
        case .success: return .green
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        Banner(
            style: .info,
            icon: "questionmark.app.fill",
            title: "Did you know?",
            description: "You can upgrade to Pro to get all the amazing features!"
        )
        Banner(
            style: .error,
            icon: "externaldrive.fill.trianglebadge.exclamationmark",
            title: "Something went wrong",
            description: "There was an error while saving your post!"
        )
        Banner(
            style: .success,
            icon: "checkmark.circle.fill",
            title: "Post created",
            description: "Your post was created and will appear on the Dashboard"
        )
    }
    .padding(16)
}

//
//  AboutMakerView.swift
//  Trading Tracker
//
//  Created by Maros Petrus on 17/01/2023.
//

import SwiftUI

struct AboutAuthorView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("About author")
                        .font(.title.bold)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(Color(uiColor: .label))
                    }
                }
                .padding(16)
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Asset.Images.author.swiftUIImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        Text("Hi, I am Ivan, the developer of this app.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(uiColor: .label))
                        Text("As a passionate indie developer and software engineer, I created this app to meet my own needs and aspirations. \n\nUsing it daily helps me refine my skills, understand what works, and what doesn't in my development journey. \n\nYour support means the world to me as I strive to grow in this field and offer more features to my users.\n\nPlease don't hesitate to reach out to me through this app or my social media channels. \n\nYour feedback and engagement are greatly appreciated.")
                            .foregroundColor(Color(uiColor: .label))
                        HStack(spacing: 16) {
                            Spacer()
                            Button {
                                guard let instagramUrl = URL(string: Constants.instagram) else { return }
                                openUrl(instagramUrl)
                            } label: {
                                Asset.Images.instagram.swiftUIImage
                            }
                            Button {
                                guard let twitterUrl = URL(string: Constants.twitter) else { return }
                                openUrl(twitterUrl)
                            } label: {
                                Asset.Images.twitterColor.swiftUIImage
                            }
                            Button {
                                guard let twitchUrl = URL(string: Constants.twitch) else { return }
                                openUrl(twitchUrl)
                            } label: {
                                Asset.Images.twitch.swiftUIImage
                            }
                            Button {
                                guard let instagramUrl = URL(string: "mailto:\(Constants.supportEmail)") else { return }
                                openUrl(instagramUrl)
                            } label: {
                                Image(systemName: "envelope")
                                    .font(.system(size: 48, weight: .medium))
                                    .foregroundColor(Color(uiColor: .label))
                            }
                            Spacer()
                        }
                    }
                    .padding(16)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

struct AboutAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAuthorView()
    }
}

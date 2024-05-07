//
//  AppDelegate.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import RevenueCat
import Mixpanel

/// External SDKs such as Firebase or RevenueCat are configured here.
///
///
/// 
@main
class AppDelegate: NSObject, UIApplicationDelegate {

    var window: UIWindow?
    let dependencies = AppDependencies()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        Purchases.configure(withAPIKey: Constants.revenueCat)
        Mixpanel.initialize(token: Constants.mixpanel, trackAutomaticEvents: true)
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

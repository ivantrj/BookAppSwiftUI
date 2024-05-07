//
//  SceneDelegate.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import UIKit

/// This is the starting point of the app.
/// The AppRouter starts here.
///
///
class SceneDelegate: NSObject, UIWindowSceneDelegate {

    var window: UIWindow?
    let dependencies = AppDependencies()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()

        let navigationController = UINavigationController(rootViewController: UIViewController())
        navigationController.setNavigationBarHidden(true, animated: true)
        window?.rootViewController = navigationController

        AppRouter(
            dependencies: dependencies,
            mainNavigationController: navigationController
        ).start()
    }
}

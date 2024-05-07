//
//  UINavigationControllerExtension.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import SwiftUI

extension UINavigationController {
    func pushView<V: View>(_ view: V, animated: Bool = true) {
        pushViewController(UIHostingController(rootView: view), animated: animated)
    }
}

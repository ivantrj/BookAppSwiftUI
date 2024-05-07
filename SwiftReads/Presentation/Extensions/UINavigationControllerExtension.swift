//
//  UINavigationControllerExtension.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import SwiftUI

extension UINavigationController {
    func pushView<V: View>(_ view: V, animated: Bool = true) {
        pushViewController(UIHostingController(rootView: view), animated: animated)
    }
}

//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let appCoordinator = AppCoordinator()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(
            rootView: AppRootView { AppCoordinatorView(coordinator: appCoordinator) }
        )
        window?.makeKeyAndVisible()
    }
}


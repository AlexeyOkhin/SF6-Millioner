//
//  SceneDelegate.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 05.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let registerVC = RegisterViewController()
        let navigationVC = UINavigationController(rootViewController: registerVC)
        navigationVC.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }

}


//
//  SceneDelegate.swift
//  Timer
//
//  Created by macbook air on 2022/05/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var imageView: UIImageView?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        if let imageView = imageView {
            imageView.removeFromSuperview()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        guard let window = window else{
            return
        }
        imageView = UIImageView(frame: window.frame)
        imageView?.image = UIImage(named: "switcher")
        window.addSubview(imageView!)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}


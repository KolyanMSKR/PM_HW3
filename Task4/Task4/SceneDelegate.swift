//
//  SceneDelegate.swift
//  Task4
//
//  Created by Admin on 12/23/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var blurredEffectView: UIVisualEffectView!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        guard let blurredEffectView = blurredEffectView else { return }
        blurredEffectView.removeFromSuperview()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        guard let blurredEffectView = blurredEffectView else { return }
        blurredEffectView.removeFromSuperview()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        guard let frame = window?.frame else { return }
        blurredEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurredEffectView.frame = frame
        window?.addSubview(blurredEffectView)
    }


}


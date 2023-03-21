//
//  SceneDelegate.swift
//  GoodLifeApplocation
//  Created by heba isaa on 24/07/2022.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
   
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let _delegate = UIApplication.shared.delegate as? AppDelegate {
            _delegate.window = window
        }
        saveLogin()
//      setRootVC(vc: AvailableSupportVC())
        
    }
    
    func setRootVC (vc:UIViewController) {
        
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }
    
 
    func saveLogin(){
        
        do {
            
            let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
            print(token)
            if token == ""{
                setRootVC(vc: SplashScreen())
            } else {
                let nav1 = UINavigationController()
                let mainView = TabBarVC.instantiate()
                nav1.viewControllers = [mainView]
                nav1.navigationBar.isHidden = true
                setRootVC(vc: nav1)
            }
            
        }
        catch{
            
            setRootVC(vc: SplashScreen())

        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


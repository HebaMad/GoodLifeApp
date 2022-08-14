//
//  Extension.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/08/2022.
//

import Foundation
import UIKit
extension UIViewController{
    var sceneDelegate:SceneDelegate{
        return (self.view.window?.windowScene?.delegate)! as! SceneDelegate
    }
}

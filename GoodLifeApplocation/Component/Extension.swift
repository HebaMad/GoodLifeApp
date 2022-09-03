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
extension UILabel{
    func addLeading(image: UIImage, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        
        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        let space = NSMutableAttributedString(string: " ", attributes: [:])
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(space)
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}

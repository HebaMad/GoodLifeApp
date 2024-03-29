//
//  Extension.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/08/2022.
//

import Foundation
import UIKit
import MaterialComponents.MaterialSnackbar

extension UIViewController{
  

    var sceneDelegate:SceneDelegate{
        return (self.view.window?.windowScene?.delegate)! as! SceneDelegate
    }
    
    func showSnackBar(message:String){
        let answerMessage = MDCSnackbarMessage()
        answerMessage.text =  message

        MDCSnackbarManager.default.show(answerMessage)
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

extension String {
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    var htmlAttributed: (NSAttributedString?, NSDictionary?) {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return (nil, nil)
            }

            var dict:NSDictionary?
            dict = NSMutableDictionary()

            return try (NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: &dict), dict)
        } catch {
            print("error: ", error)
            return (nil, nil)
        }
    }
    
    func htmlAttributed(using font: UIFont, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(font.pointSize)pt !important;" +
                "font-family: \(font.familyName), Helvetica !important;" +
                "}</style> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }

    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }

}

extension UIView {
    func convertDateFormaterName(_ dates: String) -> (String)
        {
        
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd "
            guard let date = formatter.date(from: dates) else { return "" }
            formatter.dateFormat = "LLLL dd, yyyy"
            return formatter.string(from: date)

           

        }
    
    func convertDateFormaterFullString(_ dates: String) -> (String)
        {
            let formatter = DateFormatter()
              formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssssssZ"
              guard let date = formatter.date(from: dates) else { return ""}
              formatter.dateFormat = "LLLL, dd, yyyy"
              return formatter.string(from: date)

        }
}



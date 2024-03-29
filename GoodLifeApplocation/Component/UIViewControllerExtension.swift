//
//  UIViewControllerExtension.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit
import SVProgressHUD
import SystemConfiguration


extension UIView {
  
  func lock() {
    if let _ = viewWithTag(10) {
      //View is already locked
    }
    else {
      let lockView = UIView(frame: bounds)
      lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
      lockView.tag = 10
      lockView.alpha = 0.0
        let activity = UIActivityIndicatorView(style: .white)
      activity.hidesWhenStopped = true
      activity.center = lockView.center
      lockView.addSubview(activity)
      activity.startAnimating()
      addSubview(lockView)
      
      UIView.animate(withDuration: 0.2, animations: {
        lockView.alpha = 1.0
      })
    }
  }
  
  func unlock() {
    if let lockView = viewWithTag(10) {
      UIView.animate(withDuration: 0.2, animations: {
        lockView.alpha = 0.0
      }, completion: { finished in
        lockView.removeFromSuperview()
      })
    }
  }
  
  func fadeOut(_ duration: TimeInterval) {
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 0.0
    })
  }
  
  func fadeIn(_ duration: TimeInterval) {
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 1.0
    })
  }
  
  class func viewFromNibName(_ name: String) -> UIView? {
    let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
    return views?.first as? UIView
  }
    
    func convertTimeformat(_ date: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
        let date = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 3)

        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "en_us")

        return  dateFormatter.string(from: date ?? Date())

    }
    
    func convertDateFormater(_ date: String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_us")

            return  dateFormatter.string(from: date ?? Date())

        }
    
    func setBorder(with color:UIColor,width:CGFloat){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

extension UIViewController {
    
    func showAlertPopUp(title: String, message: String, buttonTitle1: String = "OK", buttonTitle2: String = "Cancel", buttonTitle1Style: UIAlertAction.Style = .default, buttonTitle2Style: UIAlertAction.Style = .default, action1 buttonTitle1Action: @escaping (() -> Void), action2 buttonTitle2Action: @escaping (()->Void)) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let button1 = UIAlertAction.init(title: buttonTitle1, style: buttonTitle1Style) { (action) in
            print("\(buttonTitle1) Button")
            buttonTitle1Action()
        }
        let button2 = UIAlertAction.init(title: buttonTitle2, style: buttonTitle2Style) { (action) in
            print("\(buttonTitle2) Button")
            buttonTitle2Action()
        }
        alert.addAction(button1)
        alert.addAction(button2)

//        alert.addAction(button2)
        self.present(alert, animated: true, completion: nil)
    }
    
    
 func showAlertMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    typealias InternetConnectionChecker = ( _ status: Bool) -> Void

   func internetConnectionChecker(callback: @escaping InternetConnectionChecker){
        if UIViewController.isConnectedToInternet() {
            callback(true)
        }else{
            callback(false)

        }
    }
    
    public static func isConnectedToInternet() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    
    
    public func showLoading(){
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        SVProgressHUD.show(withStatus: "Please wait ... ")
    }

    public func hideLoading(){
        SVProgressHUD.dismiss()
    }
    
    
}

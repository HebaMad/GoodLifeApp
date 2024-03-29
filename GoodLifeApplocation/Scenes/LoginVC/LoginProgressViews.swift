//
//  LoginProgressViews.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/08/2022.
//

import UIKit
import MaterialComponents.MaterialSnackbar

class LoginProgressViews: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    @IBOutlet weak var continueAction: UIButtonDesignable!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Properties
    
    private var progressIndex=0
    var vc:UIViewController?
    var mobileNumber = ""
    let presenter = AuthPresenter()
    var latitude:Double = 0.0
    var longitude:Double = 0.0

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkProgressStstus()
        bindButton()
    }
}

   //MARK: - Binding

private extension LoginProgressViews{
    func bindButton(){
        continueAction.addTarget(self, action: #selector(checkProgressStstus), for: .touchUpInside)
    }
}

  //MARK: - private Handler

   
private extension LoginProgressViews{

    @objc func checkProgressStstus(){
        
        switch progressIndex{
            
        case 0 :
            self.containerView.subviews.first?.removeFromSuperview()
            
            stepsIndicator.currentStep = 1
             vc=OnBoardingFrame1()
            self.addChild(vc!)
            self.containerView.addSubview(vc!.view)
            self.progressIndex=1
            vc!.didMove(toParent: self)
            vc!.view.frame = containerView.bounds
        case 1 :
            let text = (vc as! OnBoardingFrame1).phoneNumberTxtField.text
            if text?.isEmpty == true {
                self.progressIndex=1
            showAlertMessage(title: "Notice", message: "please Enter your mobile number ")
                
            }else{
                print(UserDefaults.standard.string(forKey: "fcmToken") ?? "")
                print(text ?? "")

            self.presenter.login(mobile: text ?? "", token: UserDefaults.standard.string(forKey: "fcmToken") ?? "")
            self.presenter.delegate = self
            mobileNumber = text ?? ""
     
            }
        case 2 :
            let text = (vc as! VerificationVC).codeTxtField.text
            print(text ?? "")
            if text?.isEmpty == true {
                self.progressIndex=2

                
            }else{
                self.presenter.checkCode(mobile:mobileNumber, code: text ?? "")
                self.presenter.delegate=self

            }
        default:
            print("error click")
        }
        
    }
    
//    func showSnackBar(message:String){
//        let answerMessage = MDCSnackbarMessage()
//        answerMessage.text =  message
//
//        MDCSnackbarManager.default.show(answerMessage)
//    }
}
                                  
extension LoginProgressViews:AuthDelegate{
    func getuserToken(data: startFundRaise) {}
    
    func getLoginToken(data: userProfile) {
        do{
            try KeychainWrapper.set(value: "Bearer"+" "+data.api_token! , key: data.mobile ?? "")
            AppData.mobile = data.mobile ?? ""
            latitude = Double(data.latitude ?? "") ?? 0.0
            longitude = Double(data.longitude ?? "") ?? 0.0
            UserDefaults.standard.set(latitude, forKey: "lat")
            UserDefaults.standard.set(longitude, forKey: "long")

          } catch let error {
            print(error)
      }
    }

    
    func checkStatus(status: Bool, msg: String, screen: String) {
        if status == true{
            
            if screen == "login"{
                self.containerView.subviews.first?.removeFromSuperview()
                showSnackBar(message:msg)

                stepsIndicator.currentStep = 2
                 vc=VerificationVC()
                self.addChild(vc!)
                self.containerView.addSubview(vc!.view)
                self.progressIndex=2
                vc!.didMove(toParent: self)
                vc!.view.frame = containerView.bounds
            }else{
               
                self.progressIndex=3

                let nav1 = UINavigationController()
                let mainView = TabBarVC.instantiate()
           
                nav1.viewControllers = [mainView]
                nav1.navigationBar.isHidden = true
             self.sceneDelegate.setRootVC(vc: nav1)
                
            }
        }else{
            showSnackBar(message:msg)
        }
    }
    
    
    func showAlerts(title: String, message: String) {
        showSnackBar(message:message)
    }
               
                
}

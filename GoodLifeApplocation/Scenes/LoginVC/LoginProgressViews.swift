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
                
            self.presenter.signup(mobile: text ?? "")
            self.presenter.delegate = self
                                  
            mobileNumber = text ?? ""
            self.containerView.subviews.first?.removeFromSuperview()
            
            stepsIndicator.currentStep = 2
             vc=VerificationVC()
            self.addChild(vc!)
            self.containerView.addSubview(vc!.view)
            self.progressIndex=2
            vc!.didMove(toParent: self)
            vc!.view.frame = containerView.bounds
            }
        case 2 :
            let text = (vc as! VerificationVC).codeTxtField.text
            print(text ?? "")
            if text?.isEmpty == true {
                self.progressIndex=2

                
            }else{
                self.presenter.checkCode(mobile:mobileNumber, code: text ?? "")
                self.presenter.delegate=self

                self.progressIndex=3

            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController")
             self.sceneDelegate.setRootVC(vc: vc)
            }
        default:
            print("error click")
        }
        
    }
    
    func showSnackBar(message:String){
        let answerMessage = MDCSnackbarMessage()
        answerMessage.text =  message

        MDCSnackbarManager.default.show(answerMessage)
    }
}
                                  
extension LoginProgressViews:AuthDelegate{
    func showAlerts(title: String, message: String) {
        showSnackBar(message:message)
    }
               
                
}

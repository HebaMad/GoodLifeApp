//
//  LoginProgressViews.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/08/2022.
//

import UIKit

class LoginProgressViews: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    @IBOutlet weak var continueAction: UIButtonDesignable!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Properties
    
    private var progressIndex=0
        
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
            let vc=OnBoardingFrame1()
            self.addChild(vc)
            self.containerView.addSubview(vc.view)
            self.progressIndex=1
            vc.didMove(toParent: self)
            vc.view.frame = containerView.bounds
        case 1 :
            self.containerView.subviews.first?.removeFromSuperview()
            
            stepsIndicator.currentStep = 2
            let vc=VerificationVC()
            self.addChild(vc)
            self.containerView.addSubview(vc.view)
            self.progressIndex=2
            vc.didMove(toParent: self)
            vc.view.frame = containerView.bounds
            
        case 2 :
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController")
             self.sceneDelegate.setRootVC(vc: vc)
        default:
            print("error click")
        }
        
    }
}

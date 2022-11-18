//
//  SplashScreen.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class SplashScreen: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var getStartedBtn: UIButtonDesignable!
    @IBOutlet weak var loginBtn: UIButton!
    
    //MARK: - properties
    

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindGetStarted()
    }


}

//MARK: - Binding

private extension SplashScreen{
    
    func bindGetStarted() {
        
        getStartedBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }

}

//MARK: - Private Handler

private extension SplashScreen{

    @objc func  buttonWasTapped(sender:UIButton){
        
        switch sender {
            
        case loginBtn:
            
           let vc = LoginProgressViews()
            self.sceneDelegate.setRootVC(vc: vc)
//            Alert.showSuccessAlert(message: "test testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest")
//            Alert.showErrorAlert(message: "error")
            
        case getStartedBtn:
            
           let vc = OnBoardingVC()
            self.sceneDelegate.setRootVC(vc: vc)
            
        default:
              print("")
        }
     

        
    }
}


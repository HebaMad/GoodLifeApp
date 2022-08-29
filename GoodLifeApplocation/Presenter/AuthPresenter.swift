//
//  AuthPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit
protocol AuthDelegate{
    func showAlert(title:String,message:String)
    func goToVerificationCodeVC()
    func goToAccessLocationVC()
    func goToLastOnBoardingScreen()

}
typealias authDelegate = AuthDelegate & UIViewController

class AuthPresenter:NSObject{
    weak var delegate:authDelegate?

    private func signup(mobile:String){
        
        SignUserManager.shared.signUpUser(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    DispatchQueue.main.async {

                    self.delegate?.goToVerificationCodeVC()
                    }
                }else{
                    DispatchQueue.main.async {
                        self.delegate?.showAlert(title:"Failure", message: response.message)
                    }
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")

                
            }
        }
    }
    
    private func resendCode(mobile:String){
        
        SignUserManager.shared.resendCode(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
              

                }else{
                    DispatchQueue.main.async {
                        self.delegate?.showAlert(title:"Failure", message: response.message)
                    }
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")

                
            }
        }
    }
    private func checkCode(mobile:String,code:String){
        
        SignUserManager.shared.checkCode(mobile: mobile, code: code) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    DispatchQueue.main.async {
                       
                    self.delegate?.goToAccessLocationVC()
                        }
                }else{
                    DispatchQueue.main.async {

                    self.delegate?.showAlert(title:"Failure", message:  response.message)
                    }
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")

            }
        }
    }
    
    
    private func startInvestiment(latitude:String,longitude:String,work_type:String,amount_raise:Float){
        
        SignUserManager.shared.startFundRaise(latitude: latitude, longitude: longitude, work_type: work_type, amount_raise:amount_raise ) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    DispatchQueue.main.async {

                    self.delegate?.goToLastOnBoardingScreen()
                    }
                }else{
                    DispatchQueue.main.async {

                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                }
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")

            }
        }
    }
    
}

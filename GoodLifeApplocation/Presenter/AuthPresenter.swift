//
//  AuthPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit
protocol AuthDelegate{
    func showAlerts(title:String,message:String)


}
typealias authDelegate = AuthDelegate & UIViewController

class AuthPresenter:NSObject{
    weak var delegate:authDelegate?

     func signup(mobile:String){
        
        SignUserManager.shared.signUpUser(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        self.delegate?.showAlerts(title:"Success", message: response.message)

                }else{
                        self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
                
            case let .failure(error):
                print(error)

                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")

                
            }
        }
    }
    
     func resendCode(mobile:String){
        
        SignUserManager.shared.resendCode(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
              

                }else{
                        self.delegate?.showAlerts(title:"Failure", message: response.message)
                   
                }
                
            case let .failure(error):
                print(error)

                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")

                
            }
        }
    }
     func checkCode(mobile:String,code:String){
        
        SignUserManager.shared.checkCode(mobile: mobile, code: code) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message:  response.message)

                }else{
                    DispatchQueue.main.async {

                    self.delegate?.showAlerts(title:"Failure", message:  response.message)
                    }
                }
                
            case let .failure(error):
                print(error)

                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")

            }
        }
    }
    
    
     func startInvestiment(latitude:String,longitude:String,work_type:String,amount_raise:Float){
        
        SignUserManager.shared.startFundRaise(latitude: latitude, longitude: longitude, work_type: work_type, amount_raise:amount_raise ) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        self.delegate?.showAlerts(title:"Success", message: response.message)

                }else{

                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
            case let .failure(error):
                print(error)
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")

            }
        }
    }
    
}

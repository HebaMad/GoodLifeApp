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
    func checkStatus(status:Bool,msg:String,screen:String)


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
                    self.delegate?.checkStatus(status: true,msg: response.message, screen: "signup")

                }else{
                        self.delegate?.showAlerts(title:"Failure", message: response.message)
                    self.delegate?.checkStatus(status: false,msg: response.message, screen: "signup")

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
                    self.delegate?.checkStatus(status: true,msg: response.message, screen: "verification")


                }else{
                        self.delegate?.checkStatus(status: false,msg: response.message, screen: "verification")

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
    
    func login(mobile:String){
        SignUserManager.shared.login(mobile: mobile) { Response in
      
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.checkStatus(status: true,msg: response.message, screen: "login")

                }else{
                    self.delegate?.checkStatus(status: false,msg: response.message, screen: "login")

                }
            case let .failure(error):
                print(error)
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")

            }
        }
    }
    
}

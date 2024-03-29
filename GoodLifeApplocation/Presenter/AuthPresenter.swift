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
    func getuserToken(data:startFundRaise)
    func getLoginToken(data:userProfile)
    
}
typealias authDelegate = AuthDelegate & UIViewController

class AuthPresenter:NSObject{
    weak var delegate:authDelegate?
    
    func signup(mobile:String){
        
        SignUserManager.shared.signUpUser(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    self.delegate?.checkStatus(status: true,msg: response.message ?? "", screen: "signup")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                    self.delegate?.checkStatus(status: false,msg: response.message ?? "", screen: "signup")
                }
                
                
            case  .failure(_):
                
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
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
                
            }
        }
    }
    func checkCode(mobile:String,code:String){
        
        SignUserManager.shared.checkCode(mobile: mobile, code: code) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.checkStatus(status: true,msg: response.message ?? "", screen: "verification")
                    self.delegate?.getLoginToken(data: response.data!)
                    
                }else{
                    self.delegate?.checkStatus(status: false,msg: response.message ?? "", screen: "verification")
                }
                
            case  .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
        }
    }
    
    
    func startInvestiment(mobile:String,latitude:String,longitude:String,city:String,work_type:String,amount_raise:Float,interest:[String],talent:[String]){
        
        SignUserManager.shared.startFundRaise(mobile: mobile, latitude: latitude, longitude: longitude, city: city, work_type: work_type, amount_raise:amount_raise,interest:interest ,talent:talent ) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getuserToken(data: response.data!)
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "" )
                }
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
        }
    }
    
    func login(mobile:String,token:String){
        SignUserManager.shared.login(mobile: mobile, token: token) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.checkStatus(status: true,msg: response.message ?? "", screen: "login")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
        }
    }
    
}

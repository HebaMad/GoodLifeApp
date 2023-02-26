//
//  ProfilePresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit
import SVProgressHUD

protocol ProfileDelegate{
    func showAlerts(title:String,message:String)
    func getUserData(data:userProfile)
    func getUrlForWebPages(data:termsAndConditions)
    
}

typealias profileDelegate = ProfileDelegate & UIViewController

class ProfilePresenter:NSObject{
    
    var delegate:profileDelegate?
    
    func sendContactMsg(msg:String){
        SettingManager.shared.sendContactMsg(msg: msg) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
            
        }
    }
    
    func termsAndCondition(){
        SettingManager.shared.termsAndCondition { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getUrlForWebPages(data: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
        }
    }
    
    func PrivacyPolicy(){
        SettingManager.shared.privacyPolicy { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getUrlForWebPages(data: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case let .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func logout(){
        SettingManager.shared.logout{ Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: "logout Sucessfully")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
            
        }
    }
    
    func editProfile(name:String,mobileNumber:String,location:String,img:Data){
        SVProgressHUD.show()
        SettingManager.shared.editProfile(name: name, mobileNumber: mobileNumber, location: location, img: img){ Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
            SVProgressHUD.dismiss()
        }
    }
    
    func userProfile(){
        //        SVProgressHUD.show()
        
        SettingManager.shared.getUserProfile { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getUserData(data: response.data!)
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
            //            SVProgressHUD.dismiss()
            
        }
    }
    
    
    
}

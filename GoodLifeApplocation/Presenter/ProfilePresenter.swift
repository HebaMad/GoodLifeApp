//
//  ProfilePresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit

protocol ProfileDelegate{
    func showAlert(title:String,message:String)

}

typealias profileDelegate = ProfileDelegate & UIViewController

class ProfilePresenter:NSObject{
    
    var delegate:profileDelegate?
    
    
     func sendContactMsg(msg:String){
        SettingManager.shared.sendContactMsg(msg: msg) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
            
        }
    }
    
     func termsAndCondition(callback:@escaping dataCallback ){
        SettingManager.shared.termsAndCondition { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    callback(response.data?.url ?? "",true, response.message)
                
                }else{
                    callback(nil,false, response.message)
                }
                
            case let .failure(error):
                callback(nil,false, error.localizedDescription)
            }
        }
    }
    
     func PrivacyPolicy(callback:@escaping dataCallback ){
        SettingManager.shared.privacyPolicy { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    callback(response.data?.url ?? "",true, response.message)
                
                }else{
                    callback(nil,false, response.message)
                }
                
            case let .failure(error):
                callback(nil,false, error.localizedDescription)
            }
        }
    }
    
     func logout(){
        SettingManager.shared.logout{ Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)
                    
                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
     func editProfile(name:String,mobileNumber:String,location:String){
        SettingManager.shared.editProfile(name: name, mobile: mobileNumber) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)

                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")

            }
        }
    }
    
}

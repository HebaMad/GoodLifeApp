//
//  ProfileApiController.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import  UIKit

struct ProfileApiController{
    
    public static var shard: ProfileApiController = {
        let profileApiController = ProfileApiController()
        return profileApiController
    }()
    
    
    private func sendContactMsg(msg:String,callback:@escaping Callback){
        SettingManager.shared.sendContactMsg(msg: msg) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        callback(true, response.message)
                
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
            
        }
    }
    
    private func termsAndCondition(callback:@escaping dataCallback ){
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
    private func PrivacyPolicy(callback:@escaping dataCallback ){
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
    
    private func logout(callback:@escaping Callback){
        SettingManager.shared.logout{ Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        callback(true, response.message)
                
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
            
        }
    }
    
    
    private func editProfile(name:String,mobileNumber:String,location:String,callback:@escaping Callback){
        SettingManager.shared.editProfile(name: name, mobile: mobileNumber) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        callback(true, response.message)
                
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
        }
    }
    
    
    
}

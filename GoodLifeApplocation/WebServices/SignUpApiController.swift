//
//  SignUpApiController.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit

//MARK: - Closure

typealias Callback = ( _ status: Bool ,_ message:String) -> Void
typealias CallbackCheck = ( _ status: Bool) -> Void
typealias dataCallback = ((_ data:String?,_ status:Bool,_ message:String) -> Void)


struct SignUpApiController{
    
    public static var shard: SignUpApiController = {
        let SignUpApiController = SignUpApiController()
        return SignUpApiController
    }()
    
    private func signup(mobile:String,callback:@escaping Callback){
        
        SignUserManager.shared.signUpUser(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    do {
                        callback(true, response.message)
                        
                    } catch let error {
                        callback( false, error.localizedDescription)
                    }
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
        }
    }
    
    private func resendCode(mobile:String,callback:@escaping Callback){
        
        SignUserManager.shared.resendCode(mobile: mobile) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    do {
                        callback(true, response.message)
                        
                    } catch let error {
                        callback( false, error.localizedDescription)
                    }
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
        }
    }
    
    
    private func checkCode(mobile:String,code:String,callback:@escaping dataCallback){
        
        SignUserManager.shared.checkCode(mobile: mobile, code: code) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    do {
                        callback(response.data?.access_token ?? "", true, response.message)
                        
                    } catch let error {
                        callback(nil, false, error.localizedDescription)
                    }
                }else{
                    callback(nil, false, response.message)
                }
                
            case let .failure(error):
                callback(nil, false, error.localizedDescription)
            }
        }
    }
    
    private func startInvestiment(latitude:String,longitude:String,work_type:String,amount_raise:Float,callback:@escaping Callback){
        
        SignUserManager.shared.startFundRaise(latitude: latitude, longitude: longitude, work_type: work_type, amount_raise:amount_raise ) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    do {
                        callback(true, response.message)
                        
                    } catch let error {
                        callback(false, error.localizedDescription)
                    }
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
        }
    }

    
    
    
    
    
}


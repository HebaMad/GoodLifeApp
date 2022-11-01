//
//  SignUserTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 28/08/2022.
//

import Foundation
import Moya
enum SignUserTarget:TargetType{
    
    case SignUp(mobile:String)
    case resendCode(mobile:String)
    case checkCode(mobile:String,code:String)
    case startFundRaise(latitude:String,longitude:String,work_type:String,amount_raise:Float)
    case login(mobile:String,token:String)
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
  
    var path: String {
        switch self {
        case .SignUp:return "signUpUsers"
        case .resendCode: return "reSendCode"
        case .checkCode:return "checkCode"
        case .startFundRaise: return "startFundRaise"
        case .login:return "loginForUsers"
            
        }
    }
    var method: Moya.Method {
        switch self{
        case .SignUp,.resendCode,.checkCode,.startFundRaise,.login:
            return .post
       
        }
    }
    
    var task: Task{
        switch self{
            
        case .SignUp,.resendCode,.checkCode,.startFundRaise,.login:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .SignUp,.startFundRaise:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }
            
        case .resendCode,.checkCode,.login:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        
        switch self {
        case .SignUp(let mobile):
            return ["mobile":mobile]
        case .resendCode(let mobile):
            return ["mobile":mobile]
        case .checkCode( let mobile,let code):
            return ["mobile":mobile,"code":code]

        case .startFundRaise(let latitude,let longitude, let work_type,let amount_raise):
            return ["latitude":latitude,"longitude":longitude,"work_type":work_type,"amount_raise":amount_raise]

        case .login( let mobile , let token):
            return ["mobile":mobile,"fcm_token":token ,"device_type":"ios"]

        }
        
        
    }
}

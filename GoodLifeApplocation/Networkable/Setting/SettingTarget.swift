//
//  SettingTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya

enum SettingApiTarget:TargetType{
    case userProfile
    case sendContactMsg(message:String)
    case termsAndConditions
    case privacyPolicy
    case editProfile(name:String,mobileNumber:String,location:String)
    case logout

    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    
    var path: String {
        switch self {
        case .userProfile:return "profile"
        case .privacyPolicy:return "privacyPolicy"
        case .sendContactMsg:return "sendContactMsg"
        case .termsAndConditions: return "termsAndConditions"
        case .editProfile: return "editProfile"
        case .logout: return "logout"

        }
    }
    
    var method: Moya.Method {
        switch self{
        case .userProfile,.termsAndConditions,.privacyPolicy,.logout:
            return .get
            
        case .sendContactMsg,.editProfile:
            return .post
       
        }
    }
    
    var task: Task{
        switch self{
            
        case .userProfile,.termsAndConditions,.privacyPolicy,.logout:
            return .requestPlain
            
        case .sendContactMsg,.editProfile:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String : String]?{
        switch self{
        case .userProfile,.sendContactMsg,.editProfile,.logout:
            do {
                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }
            
        case .termsAndConditions,.privacyPolicy:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
        
        
    }
    var param: [String : Any]{
        
        
        switch self {
        case .sendContactMsg(let message):
            return ["message":message]
        case .editProfile(let name,let mobileNumber,let location):
            return ["name":name,"mobile":mobileNumber,"name":name]

            
        default : return [:]
        }
        
        
    }
    
    
}

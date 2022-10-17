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
    case editProfile(name:String,mobileNumber:String,location:String,img:Data)
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
            
        case .sendContactMsg:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .editProfile(let name,let mobileNumber,let location,let img):
            
            
            let userImg = MultipartFormData(provider: .data(img), name: "image_profile", fileName: "images", mimeType: "image.jpg")
              let mobileNumber = MultipartFormData(provider: .data(mobileNumber.data(using: .utf8)!), name: "mobile")
               let location = MultipartFormData(provider: .data(location.data(using: .utf8)!), name: "location")
               let name = MultipartFormData(provider: .data(name.data(using: .utf8)!), name: "name")


               let multipartData = [name,mobileNumber, location,userImg]

                         return .uploadMultipart(multipartData)
        }
    }
    
    var headers: [String : String]?{
        switch self{
        case .userProfile,.sendContactMsg,.editProfile,.logout:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
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
        case .editProfile(let name,let mobileNumber,let location,let img):
            return ["name":name,"mobile":mobileNumber,"location":location,"image_profile":img]

            
        default : return [:]
        }
        
        
    }
    
    
}

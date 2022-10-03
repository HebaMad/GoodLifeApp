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
//            do {
//                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImUzODcyODdjZjU4NGU0MDMyNTcyZGM0OTNlY2U0M2I0NTM1NTBmODQ0MTQ3OTgwYzUxMGUwZDAzMmRhODU1OTA3MjZjMTMxNTRjZTM4Njg3In0.eyJhdWQiOiIxIiwianRpIjoiZTM4NzI4N2NmNTg0ZTQwMzI1NzJkYzQ5M2VjZTQzYjQ1MzU1MGY4NDQxNDc5ODBjNTEwZTBkMDMyZGE4NTU5MDcyNmMxMzE1NGNlMzg2ODciLCJpYXQiOjE2NjQ2OTgzNjIsIm5iZiI6MTY2NDY5ODM2MiwiZXhwIjoxNjk2MjM0MzYyLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.V8ocy2HRS4wH2tidqppF_FShCqO_1P68h8eiqDouaJqK2hXqzWBLG211QQid37nRA901XOgau7kQ-NLme811fLzru-1dVYd6roSjj_xOJ6uOEeWSNJWu4H8TiZXWkl4n9V0dalLA88k2_-0_bNIg7sLx1FIJwpErhfWFsWnOn2Xw_Cykhkbwh8Kt_xBZj0r9pb90KO_-_nqyj7t2yQnRV6uI9j5LvuYjuytYRENc_XvROD5AOBaSjJcTmUJxCorpO1lC3RL6Pw8QnAf7HOpDOKCH9sGkRE1Va2Tn_X3wi42wOSak7vQNuu5K0uhMb2C6R8GS-sOihTVRRuk1SRXVzcyLTc-YoYmhiI0kvFL-L_tTpdGX21QhffDZQap1RuZ-eVk8I5nfQ8wSqv0PSMkwdfWb4s-HJoJxYWTnE-9QbfZwF51k02hYGAuXNOpvDgQBpN-W6t8UubTYwlyevC5TMz4P9LrKWTVgaDK7tKeyIdAWPw3-Bfa0oX_Fv30w9QaSP52XzGyNGbwUYsRYdlmPko7mEZ5hmlwVEjkoL_gh8d-MTgFfT3vNmL0PRfKAkf0S8icdjOhICE2IqM-SPzsEBavxAuogLFiXJ0bazLIs7Qd3T1aJ2pv8MS4aIJDnGvZhfoZTExUJy8FgEqHLfTj9W-LhCOd4WGeAZC7OXVlet9o" ,"Accept":"application/json","Accept-Language":"en"]
//            }
//            catch{
//                return ["Accept":"application/json","Accept-Language":"en"]
//            }
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

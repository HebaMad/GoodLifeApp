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
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImYxOGQ3YmY1OWQ1MTA5YmMzZDdmNTdjNjVjMTA0ZjMyNTkyNzYyNjZlMWFhNjMxNTMyODM0ZDM5NGM5NTlmNGRjZTNhNjNkYThiYmU4ZTczIn0.eyJhdWQiOiIxIiwianRpIjoiZjE4ZDdiZjU5ZDUxMDliYzNkN2Y1N2M2NWMxMDRmMzI1OTI3NjI2NmUxYWE2MzE1MzI4MzRkMzk0Yzk1OWY0ZGNlM2E2M2RhOGJiZThlNzMiLCJpYXQiOjE2NjIzMDY2MzYsIm5iZiI6MTY2MjMwNjYzNiwiZXhwIjoxNjkzODQyNjM2LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.rtnkLw0dViiNlq2aAOAcngyHzeN0x-KElkwk4QP2SNBfvRQ4CQ_8oLCKJjMBv2rBARBHcrhJP4d71eYc_ilzeYj-MIx16eDoA3XnAlYhG_updsxL9WO3Kpze8UlJnjR5m1lrKwQ1bpeFnVWNNYw3vJkUr3U5lXVhzoPIE08tcaz_agXeN4kmkNht5BtSwed5Rv9BU-Z3DGInEPG5P3dDK94ssLAA-im9FrfewURIyRZUcZBHzbOzno6PkY2p6IbYkEWLRY5Ps3tPvn_feJcsZLhl0QhQXs28N4ayFs3V99MPhfJ9XuO4oDOknGHriPAFoZ_SAE2eewqQJ6oVJ_wJHk9VCDRnLtgMhLOGn3jlVDnQMahi2bsnQjKRslPnEgGnIno2kpzgC5EbPtZiujU1P6CnMYX9gPRtelIG0ChqCUFax5sKw-aMTwH0pAnXg_wCqTKgWo5Rkwsw-48e7O3hgOdtwQhghohF65by1Y00ATqqdSnsc4o2CgU7t11MscyA6OqSFkSGj3MjX3n-3zZ-XIwh_hdtnUHTpYkxVhu85rUi6ZFcfKp6jy6m1IREiJ2aXljt6PKucIfmSal-q55UrITHOEYoLVeJzt8YTDXCoIDkp2GPBnrO5bXWH2zcH8oygb0kx0e-TWhNhN1_7Uz-n1-Si1NkwW6CDada7nVHdPA" ,"Accept":"application/json","Accept-Language":"en"]
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

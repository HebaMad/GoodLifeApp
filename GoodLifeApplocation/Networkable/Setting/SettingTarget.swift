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
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc1NzFjZWI3NjUyNmQ0MjdkODRhMGExZmQzOWU3YTE0NTVjNWI4MmM2OTFiNTViOWQ4NTIyNmYzZjUxOTVhMTU0NzdmNjdkYzY0Njk5MWU3In0.eyJhdWQiOiIxIiwianRpIjoiNzU3MWNlYjc2NTI2ZDQyN2Q4NGEwYTFmZDM5ZTdhMTQ1NWM1YjgyYzY5MWI1NWI5ZDg1MjI2ZjNmNTE5NWExNTQ3N2Y2N2RjNjQ2OTkxZTciLCJpYXQiOjE2NjE5NDA2NjAsIm5iZiI6MTY2MTk0MDY2MCwiZXhwIjoxNjkzNDc2NjYwLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.M5WQx9pm9QplzaQnUpP96QP89EzXYC9_zq_wQgMICmH37SGmq1Q-FPEtzJHRGc79nufER5vd_TIOFAAY9kA6CN1_xhe1Wxl5AnN8kFEp_2PKuvtsh2Ie8WoaUcFEFup9pVLmlYGKhAsAG5v4iChzsDlKWsOkuv9DE8VBoPTyXBjbmKavoMIMzgzK1qKrG5N1CpkRdladslsWvMSa6K_JwI5FnFqCa4eWjPpGavV9LbS2imWs0evUvUvN9RTp6b4GFERJAaHBxwClsxtRKHwX6XGIOhj95BS27SeMm_NbD8pWJ9t4ORtf5Mo7YmEgSLNPhRM5JybSHEXWCUIlZKHmS-YXoPxsNdE664l8ESlLHE05XYXV7B0O8jKpRjm7Szu5teCukzqrlzpFsQDVFHt6jiDZe2NJ_fyXIBbEi25_nnaN7Z6AXLmvNH1KbSCj7pua3Cg9_jewgnXbHxuB-U01vF1KeZY8aKofO7K2u8ILLrnMGuexdnAPrevvVa6F13-y7r_IFDRonX7twe0LEsd1QpAJ3VdyzJcqfJqsbRkcfqyeYeBc3ZNIAuqxwOwxf3mNzsr2Mm_tKJ6sWf9OSzqxNJfeXwfJVXARj8mU4dTqVtgWAZamGE6bB7HIKfEQFlTHTibjd3-KcorCuWvWIJjp66BcqgvS2zyYh3UJLlJKCmQ" ,"Accept":"application/json","Accept-Language":"en"]
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

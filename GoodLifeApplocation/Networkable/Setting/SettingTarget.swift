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
    case updateMinistryIdea(ministryIdeaID:String,title:String,details:String,time_commitment:String,monthly_revenue:String,fund_type_id:String,location:String)
    case updateVolunteerRequest(volunteerrequestId:String,title:String,location:String,date:String,time:String,details:String)
    
    case getVolunteerRequestData(volunteerrequestId:String)
    case getMinistryIdeaData(ministryIdeaId:String)

    
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
        case .updateMinistryIdea:return "updateMinistryIdea"
        case .updateVolunteerRequest:return "updateVolunteerRequest"
        case .getVolunteerRequestData: return "editVolunteerRequest"
        case .getMinistryIdeaData:return "editMinistryIdea"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .userProfile,.termsAndConditions,.privacyPolicy,.logout,.getVolunteerRequestData,.getMinistryIdeaData:
            return .get
            
        case .sendContactMsg,.editProfile,.updateMinistryIdea,.updateVolunteerRequest:
            return .post
            
        }
    }
    
    
    var task: Task{
        switch self{
            
        case .userProfile,.termsAndConditions,.privacyPolicy,.logout:
            return .requestPlain
            
        case .sendContactMsg,.updateMinistryIdea,.updateVolunteerRequest:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .getVolunteerRequestData,.getMinistryIdeaData:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
            
        case .editProfile(let name,let mobileNumber,let location,let img):
            
            
            let userImg = MultipartFormData(provider: .data(img), name: "image_profile", fileName: "images", mimeType: "image_profile.jpg")
            let mobileNumber = MultipartFormData(provider: .data(mobileNumber.data(using: .utf8)!), name: "mobile")
            let location = MultipartFormData(provider: .data(location.data(using: .utf8)!), name: "location")
            let name = MultipartFormData(provider: .data(name.data(using: .utf8)!), name: "name")
            
            
            let multipartData = [name,mobileNumber, location,userImg]
            
            return .uploadMultipart(multipartData)
        }
    }
    
    var headers: [String : String]?{
        switch self{
        case .userProfile,.sendContactMsg,.editProfile,.logout,.updateMinistryIdea,.updateVolunteerRequest,.getVolunteerRequestData,.getMinistryIdeaData:
            
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
            
        case .updateMinistryIdea(let ministryIdeaID,let title,let details,let time_commitment,let monthly_revenue,let fund_type_id,let location):
            return ["ministry_idea_id":ministryIdeaID,"title":title,"details":details,"time_commitment":time_commitment,"monthly_revenue":monthly_revenue,"fund_type_id":fund_type_id,"location":location]
        case .updateVolunteerRequest(let volunteerrequestId,let  title,let location,let date,let time,let details):
            return ["volunteer_request_id":volunteerrequestId,"title":title,"location":location,"date":date,"time":time,"details":details]
            
        case .getVolunteerRequestData(let volunteerrequestId):
            
            return ["volunteer_request_id":volunteerrequestId]
            
        case .getMinistryIdeaData(let ministryIdeaId):
            
            return ["ministry_idea_id":ministryIdeaId]


        default : return [:]
            
        }}
    
}


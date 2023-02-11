//
//  MenuTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya

enum MenuApiTarget:TargetType{
    
    case VolunteerOppourtinity(title:String,location:String,date:String,time:String,details:String)
    case createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String)
    case createFeedback(opportunity_id:String,review:String,rate:Int,img:Data)
    case getWorthyCauses
    case getSubWorthyCauses(worthycauseId:Int)
    case makeDonation(worthycauseId:Int,amount:String)
    case AddFundType(name:String,main_category_id:String,sub_category_id:String,latitude:String,longitude:String,city:String,default_need:String)
    
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    
    var path: String {
        switch self {
        case .VolunteerOppourtinity:return "createVolunteerRequest"

        case .createIdea:return "createMinistryIdea"
            
        case .createFeedback:return "createFeedback"
            
        case .getWorthyCauses:return "getWorthyCauses"
            
        case .getSubWorthyCauses: return "getSubWorthyCauses"
            
        case .makeDonation:return "makeDonation"
            
        case .AddFundType:return "createFundType"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback,.makeDonation,.AddFundType:
            return .post
            
        case .getWorthyCauses,.getSubWorthyCauses:
            return .get
       
        }
    }
    
    var task: Task{
        switch self{
   
        case .VolunteerOppourtinity,.createIdea,.makeDonation,.AddFundType:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .createFeedback(let opportunity_id,let review,let rate,let img):
            let pngData = MultipartFormData(provider: .data(img), name: "file", fileName: "files", mimeType: "image.jpg")
              let feedbackTitle = MultipartFormData(provider: .data(opportunity_id.data(using: .utf8)!), name: "opportunity_id")
               let feedbackReview = MultipartFormData(provider: .data(review.data(using: .utf8)!), name: "review")
               let feedbackRate = MultipartFormData(provider: .data("\(rate)".data(using: .utf8)!), name: "rate")



            let multipartData = [pngData,feedbackTitle,feedbackReview,feedbackRate]

                         return .uploadMultipart(multipartData)
            
        case .getWorthyCauses:
            return .requestPlain
            
        case .getSubWorthyCauses:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)

        }
    }
    var headers: [String : String]?{
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback,.makeDonation,.AddFundType:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }
        case .getWorthyCauses,.getSubWorthyCauses:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        switch self {
        case .VolunteerOppourtinity(let title,let location,let date,let time,let details):
            return ["title":title,"location":location,"date":date,"time":time,"details":details]
        
        case .createIdea(let title,let details,let time_commitment,let monthly_revenue):
            return ["title":title,"details":details,"time_commitment":time_commitment,"monthly_revenue":monthly_revenue]
        case .getSubWorthyCauses(let worthycauseId):
            return ["worthy_cause_id":worthycauseId]
            
        case .makeDonation(let worthycauseId,let amount):
            return ["worthy_cause_id":worthycauseId,"amount":amount]
        case .AddFundType( let name,let main_category_id,let sub_category_id,let latitude, let longitude,let city, let default_need):
            return ["name":name,"main_category_id":main_category_id,"sub_category_id":sub_category_id,"latitude":latitude,"longitude":longitude,"city":city,"default_need":default_need]
        default : return [:]
        }
        
        
    }
    
    
}

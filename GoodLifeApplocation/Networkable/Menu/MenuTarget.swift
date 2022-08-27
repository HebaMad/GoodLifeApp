//
//  MenuTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya

enum MenuApiTarget:TargetType{
    
    case VolunteerOppourtinity(title:String,latitude:String,longitude:String,date:String,time:String,details:String)
    case createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String)
    case createFeedback(title:String,review:String,rate:String,img:Data)
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    
    var path: String {
        switch self {
        case .VolunteerOppourtinity:return "createVolunteerRequest"

        case .createIdea:return "createMinistryIdea"
            
        case .createFeedback:return "createFeedback"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback:
            return .post
       
        }
    }
    
    var task: Task{
        switch self{
   
        case .VolunteerOppourtinity,.createIdea:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .createFeedback(let title,let review,let rate,let img):
            let pngData = MultipartFormData(provider: .data(img), name: "file", fileName: "files", mimeType: "image.jpg")
              let feedbackTitle = MultipartFormData(provider: .data(title.data(using: .utf8)!), name: "title")
               let feedbackReview = MultipartFormData(provider: .data(review.data(using: .utf8)!), name: "review")
               let feedbackRate = MultipartFormData(provider: .data(rate.data(using: .utf8)!), name: "rate")



            let multipartData = [pngData,feedbackTitle,feedbackReview,feedbackRate]

                         return .uploadMultipart(multipartData)
        }
    }
    var headers: [String : String]?{
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback:
            do {
                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }
            
        }
    }
    
    var param: [String : Any]{
        
        switch self {
        case .VolunteerOppourtinity(let title,let latitude,let longitude,let date,let time,let details):
            return ["title":title,"latitude":latitude,"longitude":longitude,"date":date,"time":time,"details":details]
        
        case .createIdea(let title,let details,let time_commitment,let monthly_revenue):
            return ["title":title,"details":details,"time_commitment":time_commitment,"monthly_revenue":monthly_revenue]

            
        default : return [:]
        }
        
        
    }
    
    
}

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
    case getWorthyCauses
    case getSubWorthyCauses(worthycauseId:Int)
    case makeDonation(worthycauseId:Int,amount:String)

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
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback,.makeDonation:
            return .post
            
        case .getWorthyCauses,.getSubWorthyCauses:
            return .get
       
        }
    }
    
    var task: Task{
        switch self{
   
        case .VolunteerOppourtinity,.createIdea,.makeDonation:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .createFeedback(let title,let review,let rate,let img):
            let pngData = MultipartFormData(provider: .data(img), name: "file", fileName: "files", mimeType: "image.jpg")
              let feedbackTitle = MultipartFormData(provider: .data(title.data(using: .utf8)!), name: "title")
               let feedbackReview = MultipartFormData(provider: .data(review.data(using: .utf8)!), name: "review")
               let feedbackRate = MultipartFormData(provider: .data(rate.data(using: .utf8)!), name: "rate")



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
        case .VolunteerOppourtinity,.createIdea,.createFeedback,.makeDonation:
//            do {
//                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImYxOGQ3YmY1OWQ1MTA5YmMzZDdmNTdjNjVjMTA0ZjMyNTkyNzYyNjZlMWFhNjMxNTMyODM0ZDM5NGM5NTlmNGRjZTNhNjNkYThiYmU4ZTczIn0.eyJhdWQiOiIxIiwianRpIjoiZjE4ZDdiZjU5ZDUxMDliYzNkN2Y1N2M2NWMxMDRmMzI1OTI3NjI2NmUxYWE2MzE1MzI4MzRkMzk0Yzk1OWY0ZGNlM2E2M2RhOGJiZThlNzMiLCJpYXQiOjE2NjIzMDY2MzYsIm5iZiI6MTY2MjMwNjYzNiwiZXhwIjoxNjkzODQyNjM2LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.rtnkLw0dViiNlq2aAOAcngyHzeN0x-KElkwk4QP2SNBfvRQ4CQ_8oLCKJjMBv2rBARBHcrhJP4d71eYc_ilzeYj-MIx16eDoA3XnAlYhG_updsxL9WO3Kpze8UlJnjR5m1lrKwQ1bpeFnVWNNYw3vJkUr3U5lXVhzoPIE08tcaz_agXeN4kmkNht5BtSwed5Rv9BU-Z3DGInEPG5P3dDK94ssLAA-im9FrfewURIyRZUcZBHzbOzno6PkY2p6IbYkEWLRY5Ps3tPvn_feJcsZLhl0QhQXs28N4ayFs3V99MPhfJ9XuO4oDOknGHriPAFoZ_SAE2eewqQJ6oVJ_wJHk9VCDRnLtgMhLOGn3jlVDnQMahi2bsnQjKRslPnEgGnIno2kpzgC5EbPtZiujU1P6CnMYX9gPRtelIG0ChqCUFax5sKw-aMTwH0pAnXg_wCqTKgWo5Rkwsw-48e7O3hgOdtwQhghohF65by1Y00ATqqdSnsc4o2CgU7t11MscyA6OqSFkSGj3MjX3n-3zZ-XIwh_hdtnUHTpYkxVhu85rUi6ZFcfKp6jy6m1IREiJ2aXljt6PKucIfmSal-q55UrITHOEYoLVeJzt8YTDXCoIDkp2GPBnrO5bXWH2zcH8oygb0kx0e-TWhNhN1_7Uz-n1-Si1NkwW6CDada7nVHdPA" ,"Accept":"application/json","Accept-Language":"en"]
//            }
//            catch{
//                return ["Accept":"application/json","Accept-Language":"en"]
//            }
            
        case .getWorthyCauses,.getSubWorthyCauses:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        switch self {
        case .VolunteerOppourtinity(let title,let latitude,let longitude,let date,let time,let details):
            return ["title":title,"latitude":latitude,"longitude":longitude,"date":date,"time":time,"details":details]
        
        case .createIdea(let title,let details,let time_commitment,let monthly_revenue):
            return ["title":title,"details":details,"time_commitment":time_commitment,"monthly_revenue":monthly_revenue]
        case .getSubWorthyCauses(let worthycauseId):
            return ["worthy_cause_id":worthycauseId]
            
        case .makeDonation(let worthycauseId,let amount):
            return ["worthy_cause_id":worthycauseId,"amount":amount]
            
        default : return [:]
        }
        
        
    }
    
    
}
